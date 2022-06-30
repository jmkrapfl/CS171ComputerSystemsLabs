//*********part 2*******
//// Create a 2D translation vector
//double tx = 10, ty = 5;
//double ty = 10, tx = 5;
//double[][] Tvals = {{tx}, {ty}};
//Matrix T = new Matrix(Tvals);


//*********part 1*********
// Create a vector (1,0)
//double [][] Pvals={{1},
//{2}};
//Matrix P = new Matrix(Pvals);

//// Create rotation matrix through 45 degrees 
//float angle=45*(PI/180);//45 degrees
//float angle=90*(PI/180);//90 degrees
//double[][] Rvals = {{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}};
//Matrix R = new Matrix(Rvals);

// Apply rotation matrix to the points
//P=R.times(P);

// Apply translation to the points--part2
//P=P.plus(T);

//*******Part 3********
//// Create a *matrix* of four 2D translation vectors, 1 for each
//// input point
double tx = 10, ty = 5;
double[][] Tvals = {{tx, tx, tx, tx},
  {ty, ty, ty, ty}};
Matrix T = new Matrix(Tvals);

// Create a matrix of points to transform
double[][] Pvals = {{1,0,-1,0},
  {0,1,0,-1}};
Matrix P = new Matrix(Pvals);

//// Create rotation matrix through 45 degrees
//float angle=45*(PI/180);
float angle=90*(PI/180);
double[][] Rvals = {{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}};
Matrix R = new Matrix(Rvals);

// Apply rotation matrix to the points
P=R.times(P);

// Apply translation to the points
P=P.plus(T);

// Print points (column width, number of digits) to console
P.print(5, 2);
