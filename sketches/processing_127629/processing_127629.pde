
// GoodReads v3

Table bookData;
int rowCount;
float mx = 29; // mouseX
int d=10; // diameter of circles
PFont mainTitle;
PFont bodyText;
PImage img;


//int[] randY = {500,120,300,340,200,670,110};

void setup() {

  size(1280, 720);
  bookData = new Table("goodreads.txt");
  rowCount = bookData.getRowCount();
  int books = rowCount;
  //println("rowCount = " + rowCount);
  //println("number of books = " + books);

  smooth();
  img =loadImage("logo.jpg");

  //LABEL FONT HERE // 

  mainTitle = loadFont("Avenir-Light-50.vlw");
  //mainTitle = loadFont("AvenirNextCondensed-BoldItalic-50.vlw"); //test
  bodyText = loadFont("AvenirLTStd-Black-15.vlw");
}

void draw() {
  cursor(HAND);
  background(255);
  smooth();
  image(img, 0, 7);
  stuff();
  bookLabel();
  String[] call = {
    "TS", "RH", "SP", "LP", "QR", "TS", "PR"
  };

  //float r = random(0,6);
  //println( call [ int(random(0,5))] );
  String rc = call[int(random(0, 5))];

  //labels 
  fill(100);
  textFont(bodyText);
  text("this shelf", 645, 370);
  text("this floor", 822, 370);
  text("+/- floor", 1145, 370);

  //println(rc);
  textFont(mainTitle);



  ///TEXT stuff ///
  fill(#982168);
  textSize(35);
  text("YOUR NEARBY \'TO-READ\' BOOKS:", 75, 55);
  textFont(bodyText);
  textSize(14);
  text("Darker color indicates higher average rating on 1-5 stars scale", 75, 80);


  //DATA STUFF// 
  int countBook = 0;
  for (int row = 0; row < rowCount; row++) {

    String title = bookData.getString(row, 0);
    String author = bookData.getString(row, 1);
    String shelf = bookData.getString(row, 9);
    String status = bookData.getString(row, 10);
    String callnum = bookData.getString(row, 13);
    String avgrating = bookData.getString(row, 5);
    float avg = new Float(avgrating);
    String[] unread = match(status, "no");
    if (unread != null)  //if read does not(!) equal null --print the ones that aren't empty
    {

      //countBook ++;

      int randY = bookData.getInt(row, 11);
      int randX = bookData.getInt(row, 12);
      //println("y= " + randY + " x= " +randX);
      int x = randX;
      float y = randY;
      float d = 30;
      float acolor = (avg/5)*255;
      //println(acolor);
      //float r = avgrating;
      //println("yellow? row " + row + " " +  (255-acolor));

      noStroke();

      //          // if (mouseX > x-20 && mouseX < x+20 && mouseY > y-20 && mouseY < y+20) {
      smooth();


      if (dist(x, y, mouseX, mouseY) < d/2) {   

        //               // other related info appears
        //               // What do you know at this moment?

        /////TEXT BOX CONTENT
        textFont(bodyText);
        textAlign(LEFT);

        fill(#982168);
        text(title, 770, 20, 480, 700);
        //               println("not read: " + title +" by "+ author);
        fill(40);
        String labels = (author +"      "+ "Call number:  " +"TS." +callnum + "      " + "Avg Rating:  " + avgrating);
        //println(labels);

        text(labels, 770, 60, 650, 700);




        fill(#982168);
        stroke(#982168);
        stroke(255);
        strokeWeight(2);
        line(x, y, 800, 100);
        //               //red plus green makes yellow. lower and lower add more yellow and green
        //               text("not read: " + title +" by "+ author,40,40);
        //
      } 
      else {

        fill(247, 152, 57, acolor);
      }

      ellipse(x, y, d, d);
      fill(0);
      //text(row,x,y);


      //            text(mouseX,40,20);
      //             text(mouseY,40,30);
    }//end read books


    //text(title, 100, 100, 700, 800);
  }//end for loop

  // println(countBook);
} // end void draw

class Table {
  int rowCount;
  String[][] data;
  
  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], TAB);
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
  
  
  void setRowName(int row, String what) {
    data[row][0] = what;
  }


  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }

  
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }

  
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }

  
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }

  
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }


  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }  
}
void bookLabel() {
  fill(255,170);
  stroke(231);
  strokeWeight(2);
  rect(0, 0, 1280, 100);  
}
//background circle/grid function

void stuff() {
  
     noStroke(); //background
  fill(#17aac4, 30);
  ellipse(width/2, height/2+20, 2000, 2000); 
  
   noStroke(); // width
  fill(#17aac4, 14);
  ellipse(width/2, height/2+20, 1000, 1000);
  

  
  
  noStroke(); // 
  fill(#17aac4, 14);
  ellipse(width/2, height/2+20, 350, 350);


  ///lines
  stroke(255);
  strokeWeight(3);
  line(width/2, 0, width/2, height);//vertical
  line(0, height/2+20, width, height/2+20); //horz
  
   noStroke();
  fill(#17aac4, 44);
  ellipse(width/2, height/2+20, 100, 100);
  
  
}



