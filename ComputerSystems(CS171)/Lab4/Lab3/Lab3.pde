Table table; // import the table class from processing. 

// getMedianTable is like the code we seen in the 3rd
// stats and probability lecture. In the code below we have to 
// adapt this code so that we can find the median for a 
// given column. The complication here is that we need to 
// take the data in the column as specified by col and 
// transfer this to an array. Then when our data from the column 
// is in the array we can use the same code as before for calculating the median. 

float getMedianTable(Table table, String col)
{
  // we need to start off by sorting the array or column
  // we need to make an array with the same number of 
  // values as the colums. 
  // we use table.getRowCount();
  
  float tempArray[] = new float[table.getRowCount()];
  
  // now we need to take the values from the col as specified
  // and copy them into our temp array. This will allow us to 
  // sort the array into ascending order (as required by the 
  // calculation for median) 
  // We must check every value in the column 
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  
  // calculate the middle index
  // between 0 and length of array - 1
  // the median is the 50 percentile 
  // so it is at 1/2 way in the sorted array. 
  int middle = (int)(tempSorted.length*0.5);
  //println("The middle of tempSorted arrray is at index " + middle);
  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    median = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return median;
}

//gets the 1st quartile
float getQ1Table(Table table, String col)
{
  float tempArray[] = new float[table.getRowCount()];
  
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  
  int middle = (int)(tempSorted.length*0.25);
  //println("The middle of tempSorted arrray is at index " + middle);
  
  float q1 = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    q1 = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    q1 = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return q1;
}

//gets the 3rd quartile
float getQ3Table(Table table, String col)
{ 
  float tempArray[] = new float[table.getRowCount()];// We must check every value in the column 
  
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  
  int middle = (int)(tempSorted.length*0.75);
  //println("The middle of tempSorted arrray is at index " + middle);
  
  float q3 = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    q3 = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    q3 = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return q3;
}

  // calculate the mean of a column in the dataset
  float getMeanTable(Table table, String col)
  {
    // This is the current mean. 
    float theMean = 0.0;
    float total = 0.0;
    // get the length of the dataset 
    int n = table.getRowCount();
    
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      float curValue = row.getFloat(col);
      // we add up all of the values in the column
      total = total + curValue;
    }
    theMean = total/n;
    return theMean;
  }


  // Get the min value in a Table column as 
  // specified by the String parameter col 
  // function to find the minimum value 
  // in a column of data. We must specify
  // the column header name via col. 
  // This is the same as the min method we seen 
  // during the previous lectures. 
  
  float getMinTable(Table table, String col)
  {
    // This is the largest value for Interger. 
    float curMin = Float.MAX_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      if (row.getFloat(col) <curMin)
      {
        curMin = row.getFloat(col);
      }
    }
    return curMin;
  }

  // Get the max value in a Table column as 
  // specified by the String parameter col 
  // function to find the max value 
  // in a column of data. We must specify
  // the column header name via col. 
  // This is the same as the max method we seen 
  // during the previous lectures. 
  
  float getMaxTable(Table table, String col)
  {
    // This is the largest value for Interger. 
    float curMax = Float.MIN_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      if (row.getFloat(col) >curMax)
      {
        curMax = row.getFloat(col);
      }
    }
    return curMax;
  }
  
  
   // This is the processing code for calculation of 
// StdDev in an float array. 

float calculateStdDev(Table table, float theMean, String col)
{
   float total = 0;
   float diff = 0;
   int n = table.getRowCount();
   
   // we need to look at each element in the array
   // subtract the mean from each element. 
   //println("the mean is "+theMean);
   //println(col);
   
   for (int i = 0; i < table.getRowCount(); i++)
   {
     //println("vaule in dataArray "+ table.getFloat(i,col));
     //println("value in diff "+diff);
     //println("the total is "+total);
     diff = pow((table.getFloat(i,col) - theMean),2);//for each data point find the square of its distance to the mean
     total = total + diff;//Sum the values
   }
  
  float variance = total/(n -1);//divide by the nummber of data points
  float stdDev = sqrt(variance);//take the square root
  
 
  return stdDev;
  
}



void setup() 
{

  // LAB - 2/3 November 2020. 
  // Here we specify the file from which we will 
  // import or extract our data. We need to change the filename to
  // correspond to the names of the data files provided. 
  
  table = loadTable("small.csv", "header");
  
  for (TableRow row : table.rows()) 
   {
   
    int index = row.getInt("Index");
    float dataA = row.getFloat("DataA");
    float dataB = row.getFloat("DataB");
    println(index +", "+dataA+", "+dataB);
    
   }
  println(" ");
  
  println("Input data file is small.csv");//will need to be changed
  println("number of rows: "+table.getRowCount());//print number of rows
  
  println("Min of DataA: "+ getMinTable(table, "DataA"));//min of a and b
  println("Min of DataB: "+ getMinTable(table, "DataB"));
  println(" ");
  
  println("Max of DataA: "+ getMaxTable(table, "DataA"));//max of a and b
  println("Max of DataB: "+ getMaxTable(table, "DataB"));
  println(" ");
  
  println("Mean of DataA: "+ getMeanTable(table, "DataA"));//mean of a and b
  println("Mean of DataB: "+ getMeanTable(table, "DataB"));
  println(" ");
  
  println("Std Dev of DataA: "+ calculateStdDev(table, getMeanTable(table, "DataA"), "DataA"));//standard dev of a and b
  println("Std Dev of DataB: "+ calculateStdDev(table, getMeanTable(table, "DataB"),"DataB"));
  println(" ");
  
  println("The median of DataA: "+ getMedianTable(table, "DataA"));//median of a and b
  println("The median of DataB: "+ getMedianTable(table, "DataB"));
  println(" ");
  
  println("The Q1 of DataA: "+ getQ1Table(table, "DataA"));//q1 of a and b
  println("The Q1 of DataB: "+ getQ1Table(table, "DataB"));
  println(" ");
  
  println("The Q3 of DataA: "+ getQ3Table(table, "DataA"));//q3 of a and b
  println("The Q3 of DataB: "+ getQ3Table(table, "DataB"));
  
 
}

void draw()
{


}
