import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil       wave;
Oscil       mod;


void setup()
{
  size(512, 200);

  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create a SINE wave Oscillator, set to 440 Hz, at 20% amplitude
  wave = new Oscil( 440, 0.25f, Waves.SINE );
  
  // create a sine wave Oscil at 2Hz for modulating the amplitude of wave
  mod  = new Oscil( 2, 0.25f, Waves.SINE );
 
  // connect up the modulator
  //we patch the modulator to the amplitude of our main waveform
  mod.patch( wave.amplitude );
  
  // patch the modulated wave to the output

  wave.patch( out );
}

void draw()
{
  background(0);
  stroke(255);
  
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }
}

void mouseMoved()
{
  float modulateAmount = map( abs(height-mouseY), 0, height, 0, 1 );
  float modulateFrequency = map( mouseX, 0, width, 1, 100 );
  
  mod.setAmplitude( modulateAmount );
  mod.setFrequency( modulateFrequency );

}

void keyPressed()
{
  if(key =='1')
  {
    wave.setWaveform(Waves.SQUARE);
  }
  if(key =='2')
  {
    wave.setWaveform(Waves.TRIANGLE);
  }
  if(key =='3')
  {
    wave.setWaveform(Waves.SQUARE);
  }
  if(key =='4')
  {
    wave.setWaveform(Waves.QUARTERPULSE);
  }
}
