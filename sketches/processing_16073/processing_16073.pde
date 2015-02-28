
          /*  project name: an "UNCONVENTIONAL WAY TO REPRESENT TIME"
          written by: Naghmi Shireen
          Date: 5th Oct, 2010
          email: nshireen@sfu.ca
          */
          
          /*My program divides the display window into six rows and ten columns, making 60 boxes starting from 0-59. the first box is a "zero" numbered box
          and the last box is "59th" number box. with every passing second, a rectangle moves through all those boxes one by one, till it reaches 59th box.
          Which marks a competion of one minute, which makes another rectagle[minute-rectangle] to move one step ahead into next box. 
          The second's rectangle starts its journey again, and again, with every second, it changes its position.
          
          Minutes and seconds are being represented by two types of RECTANGLES, while, hours are being represented by Number of balls. 
          With every hour, one ball is added to the already existing number of balls.
          Number of balls are "zero" at 00:00 [12:00 am], they increase as the hours start increasing. 
          There are maximum balls, i.e., "23 number of balls" at 23:00 or 11:00 pm. */
          
          
          //declaring and initializing global variable[num of rows and num of columns
int col=10,row=6;

        //declaring two arrays to store X and Y position of rectangle moving with each second 
        //and also i have used the same arrays to store position of rectangle which moves with each minute
int[] secX=new int[col];
int[] secY=new int[row];

        //declaring variables for column width and row height
int colSpan;
int rowSpan;

        //declaring two arrays for formation of a grid lines, as a background image of a clock
int[] x=new int[col];
int[] y=new int[row];

        //declaring a global variable which will hold seconds and minutes value
int sec,m; 


        //calling a setup function
void setup(){
        size(600,360);
        background(255);
        smooth();
       
        frameRate(30);
        
                //initiallzing the width and heigth of col and rows to be zero initially
           rowSpan=0;
           colSpan=0;
      
                  //storing "y positions" for rectagles in an array as the rectangles moves through a row, x position remains the same.
           for(int i=0;i<row;i++){
             secY[i]=rowSpan;
             rowSpan+=60;
                   //println(secY[i]);
           }
       
                 //storing xpositions for rectangles in an array as the rectangles moves through a column, y position remains the same
             for (int j=0;j<col;j++){
               secX[j]=colSpan;
               colSpan+=60;
               //println(secX[j]);
             }
             
                 // a class of balls has been initialized here to make it run just once during the whole program, to avoid repetitive storing by computer.
                 //this array will store 24 balls with random sizes and random positions, each representing one hour.
                 //here with each iteration, array is calling a Ball class, with arguments
              for (int i = 0; i < balls.length; i++) {
              balls[i] = new Ball(random(width), random(height), random(20, 40), i, balls);
            }
      
                 //colspan and rowspan are again initiallized back to zero before next array is being initialized through them
           colSpan=0;
           rowSpan=0;
      
                 // these two arrays are initialized for x and y positions of "grid lines"
            for(int i=0;i<col;i++){
               x[i]=int(colSpan);
                colSpan+=width/col;
               }
            for (int i=0;i<row;i++){
               y[i]=int(rowSpan);
               rowSpan+=height/row;
            }
   
}

    //starts draw function
void draw(){

    //draw function only calls hours function, all other functions are being called in hour function
  hourBall();
}
  
  

