// import Jama.*;
// Solve 3x+2y=3
//      -2x-y=-1
// AX=B
// X=InvA B

import java.io.StringWriter;

void setup() 
{
   size(250,200);
      
   //double [][] Aline12={{ 3, 2},      // Create a 2D array to store A
                       //{-2,-1}};
   double [][] Aline12 = {{1, 1, 1},
                          {1, 2, 3},
                          {1, 5, -3}};
    
   Matrix A = new Matrix(Aline12);    // Copy array to A Matrix data structure
   
   //double [][]  B1ine12 = {{3},       // Create a 2D array to store B
                          //{-1}};
    
    double [][]  B1ine12 = {{9},
                            {23},
                            {-7}};
    
   Matrix B = new Matrix(B1ine12);    // Copy array to B Matrix data structure
    
   Matrix X=(A.inverse()).times(B);   // Solve for X
   
   //X.print(5,2);                      // Print(column width, decimal places) on console
   
   
   
   text("A",10,12);
   app_print(A,0,16);
   
   text("B",110,12);
   app_print(B,150,16);
   
   text("X",10,85);
   app_print(X,0,95);
}

// Method added to allow printing on applet screen at (x,y) 
void app_print(Matrix P, int x, int y)
{ 
  StringWriter stringWriter = new StringWriter();
  PrintWriter writer = new PrintWriter(stringWriter);
  P.print(writer,5,2);  
  text(stringWriter.toString(),x,y); 
}
