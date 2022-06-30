import grafica.*;
GPlot plot1,plot2;
Table table;
void setup()
{
  size(540,350);
  
  //table = loadTable("IrishPop.csv", "csv");
  table = loadTable("IrishBthDthrate.csv", "header");

  GPointsArray Deaths = new GPointsArray(table.getRowCount());
  GPointsArray Births = new GPointsArray(table.getRowCount());
  
  
  for (TableRow row : table.rows())
  {  
    float year = row.getFloat(0);
    float births = row.getFloat(1)/1000;
    float deaths = row.getFloat(2)/1000;
    
    Births.add(year,births);
    Deaths.add(year,deaths);
    ;
  }
  Deaths.add(Births.get(25)); 
  Deaths.add(Deaths.get(Deaths.getNPoints()-2));

  
  plot1 = new GPlot(this);      // Create an instance of the Gplot class called plot1
  plot1.setPos(25, 25);         // Set the plot1 position in window to 25,25
  plot1.setDim(350, 200);       // Set plot size to 350x200 
  plot1.setMar(60, 70, 40, 70); // Set margins (bottom,left,top,right) 
  plot1.setPointSize(5);        // Sets diameter of points on screen
  plot1.setTitleText("Births (red) and deaths (blue) per year in Ireland");
  plot1.getXAxis().setAxisLabelText("Year");
  plot1.getYAxis().setAxisLabelText("Number (x1000)");
  plot1.setYLim(20, 80);        // Sets upper and lower bound of Y-axis
  plot1.setPoints(Births);      // Link the point array with the plot
  plot1.defaultDraw();          // Draw the graph
  
  plot2 = new GPlot(this);
  plot2.setPos(25, 25);
  plot2.setDim(350, 200);
  plot2.setPoints(Deaths);
  plot2.setLineColor(color(0 ,0, 0));
  plot2.setPointSize(5);
  plot2.setPointColor(color(0,0,255));
  plot2.setYLim(20,80);
  plot2.beginDraw();
  plot2.drawLines();
  plot2.drawPoints();
  plot2.endDraw();
}
