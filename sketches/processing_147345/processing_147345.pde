
String[] months = { "January", "February", "March", "April", "May", "June", "July", "August",
"September", "October", "November", "December" };

String[] seasons = { "Spring", "Spring", "Spring", "Spring", "Summer", "Summer", "Summer", "Autumn", "Autumn",
"Autumn", "Winter", "Winter" };

int monthSeasonIndex = 0;
String curMonth = "m";
String curSeason = "s";


/*ArrayList<String> months = new ArrayList<String>();
months.add("January");//spring
months.add("February");//spring
months.add("March");//spring
months.add("April");//spring
months.add("May");//summer
months.add("June");//summer
months.add("July");//summer
months.add("August");//autumn
months.add("September");//autumn
months.add("October");//autumn
months.add("November");//winter
months.add("December");//winter*/


    
final int groundLoc = 500;// the ground lies on y = 500 for planting trees...
int startStrWeight = 20;
int resetWeight = startStrWeight;



String treeTypeToBePlanted = "null";


void setup() {  //setup function called initially, only once
  size(1000, 600);//original width: 800 pixels; original height : 600 pixels
  smooth();
  background(255); //default: normal weather condition 
  fill(0, 153,0);//green
  rect(0, groundLoc, width, groundLoc);
  stroke(102,51,0);//brown
  textSize(15);
  
  strokeWeight(startStrWeight);
  
  
  
}

void draw() {  //draw function loops 
 
 
  
  if(keyPressed == true) {
  
      
      
      if( key == 'f' ) {
      
          treeTypeToBePlanted = "plantFractalTree";
      
      }
      
      if(key == 'a' ) {//must press a, then click on screen
      
          treeTypeToBePlanted = "plantAntlerTree";
          plantAntlerTree();
      }
      
      
      if(key == 'n') {
      
          treeTypeToBePlanted = "plantFanTree";
      }
      
  }
  
  
  if(mousePressed == true  ) {

      
            
      if( monthSeasonIndex < 12 ) {
          
           fill(255);//for font too
          
           rect(0,0,width,50);
          
           setTextMonth(monthSeasonIndex);
           setTextSeason(monthSeasonIndex);
           monthSeasonIndex++;
           
      } else {
      
           monthSeasonIndex = 0;
      }
      
      if( treeTypeToBePlanted.equals("plantFractalTree") ) {
      
        translate(mouseX, groundLoc );//goal move origin to startpoint
        growFractalTree(10, 100, startStrWeight);
      
      } 
      
      if( treeTypeToBePlanted.equals("plantFanTree") && curSeason.equals("Summer") ) {
      //fan trees grow larger in the summer
        translate(mouseX, groundLoc);
        growFanTree(8,100,startStrWeight, 2);
      
      } else if( treeTypeToBePlanted.equals("plantFanTree") && !curSeason.equals("Summer")  ) {
      
        translate(mouseX, groundLoc);
        growFanTree(8-2,100,startStrWeight, 2);
      
      }
      
      if( treeTypeToBePlanted.equals("plantAntlerTree") ) {//special case..look above
      
        
        growAntlerTree();
      
      }
      
      

  }
  
  
}

void growFanTree(int brLv, float len, int strWeight, int modRotate) {
    
    //brLv should be <= 8!
    if(brLv == 0 ) {
    
        return;
    }
    
    if(brLv <= 3 && curSeason.equals("Spring")) {
    
        stroke(0,102,0);//make green
    
    }
    
    if(brLv <= 3 && curSeason.equals("Summer")) {
    
        stroke(204,0,0);//make red
    
    }
    
    if(brLv <= 3 && curSeason.equals("Autumn") ) {
    
        stroke(204,102,0);//make orange
    
    }
    
    if(brLv <= 3 && curSeason.equals("Winter")) {
    
        stroke(0,0,255);//make blue
    
    }
    
    //point(0,0);
    
    line(0, 0, 0, -len);//draw from ground upwards; use neg val after translation
    translate(0,-len);//move origin to endpoint of line
    strokeWeight(strWeight * .6);
    
    pushMatrix();
    
    rotate(-HALF_PI/modRotate);//rotate counter clockwise
    //line(0,0, 0, -len/2);//don't draw line!
    
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(HALF_PI/modRotate);//rotate clockwise
   
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(-QUARTER_PI/modRotate);
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(QUARTER_PI/modRotate);
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    startStrWeight = resetWeight;//start reset sequence
    stroke(102,51,0);//brown
    strokeWeight(startStrWeight);


}

void growFractalTree(int brLv, float len, int strWeight) {

    //brLv should be <= 10!
    if(brLv == 0 ) {
    
        return;
    }
    
    
    
    if( brLv <= 5 && curSeason.equals("Spring") ) {
    
        stroke(51,102,0);//grow green branches
    
    }
    
    if( brLv <= 5 && curSeason.equals("Summer") ) {
    
        stroke(153,0,51);//grow red branches
    
    }
    
    if( brLv <= 5 && (curSeason.equals("Autumn") || curSeason.equals("Winter") ) ) {
    
        stroke(102,51,0);//brown
    
    }
    
    
    //point(0,0);
    
    line(0, 0, 0, -len);//draw from ground upwards; use neg val after translation
    translate(0,-len);//move origin to endpoint of line
    strokeWeight(strWeight * .6);
    
    pushMatrix();
    
    rotate(-QUARTER_PI);//rotate counter clockwise
    //line(0,0, 0, -len/2);//don't draw line!
    
    growFractalTree(brLv - 1, len * .75, strWeight * .6);
    
    popMatrix();
    
    pushMatrix();
    rotate(QUARTER_PI);//rotate clockwise
   
    growFractalTree(brLv - 1, len * .75, strWeight * .6);
    
    popMatrix();
    
    startStrWeight = resetWeight;//start reset sequence
    stroke(102,51,0);//brown
    strokeWeight(startStrWeight);
    
   

}


PVector endPt;//for antler tree
int distance = 100;//for antler tree

void plantAntlerTree() {

   
   strokeWeight(10);
   stroke(102, 51, 0);
   endPty = groundLoc - distance;
   line(mouseX, groundLoc , mouseX, endPty );
   endPt = new PVector(mouseX, endPty);
  
}

void growAntlerTree() {

    float endPtXForLeft = endPt.x;
    float endPtyForLeft = endPt.y;
    int distForLeft = distance;//temp variables
    
    line(endPt.x, endPt.y, endPt.x + distance/2 , endPt.y - distance/2 );//[branch right]
    endPt.x = endPt.x + distance/2;
    endPt.y = endPt.y - distance/2;
    
    line(endPt.x, endPt.y, endPt.x + distance/2, endPt.y );
    line(endPt.x, endPt.y, endPt.x , endPt.y - distance/2);
    
    
    line(endPtXForLeft, endPtyForLeft, endPtXForLeft - distForLeft/2 , endPtyForLeft - distForLeft/2);//[branch left]
    endPtXForLeft = endPtXForLeft - distForLeft/2;
    endPtyForLeft = endPtyForLeft - distForLeft/2;
    
    line(endPtXForLeft, endPtyForLeft, endPtXForLeft + distance/2, endPtyForLeft );
    line(endPtXForLeft, endPtyForLeft, endPtXForLeft  , endPtyForLeft - distance/2);
    
    
    
     
}

void setTextMonth(int index) {

    
    text("Month: " + months[index], 50, 50);//default month is january
    curMonth = months[index];
}

void setTextSeason(int index) {

    text("Season: " + seasons[index], 600, 50 );//default month is spring
    curSeason = seasons[index];

}
