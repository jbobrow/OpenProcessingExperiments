
//********Code last edited on 5/14/14**********
//**********REUPLOADED ON 5/17/14************

/*
void keyPressed() {
  if ( Character.isDigit( key ) ) {
    numTrees = 2 * Character.getNumericValue(key);
    if ( numTrees > 0 ) {
      redraw();
    }
  }
}
*/
/*to ensure trees are planted on the ground: 

if(mousePressed == true) {

    line(mouseX, groundLoc, mouseX, groundLoc - 50);//draw a vertical stick

}

*/

String[] months = { "January", "February", "March", "April", "May", "June", "July", "August",
"September", "October", "November", "December" };

String[] seasons = { "Spring", "Spring", "Spring", "Spring", "Summer", "Summer", "Summer", "Autumn", "Autumn",
"Autumn", "Winter", "Winter" };

String[] weather = {"Normal", "Heatwave", "Raining","Snowing" };

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
String treeTypeToBePlanted = "filler word to be replaced";

PVector endPt;
int endPty;
int distance = 100;//start distance & length of starting trunk

void setup() {  //setup function called initially, only once
  size(800, 600);//width: 800 pixels; height : 600 pixels
  smooth();
   background(255); //default: normal weather condition 
  fill(0, 153,0);
  //fill(102,51,0);//make dirt brown
  rect(0, groundLoc, 800, groundLoc);
  
  text("Month: " + months[0], 50, 50);//default month is january
  text("Season: " + seasons[0], 300, 50 );//default month is spring
  text("Weather: " + weather[0], 600, 50);//default weather is normal
  
  
}

void draw() {  //draw function loops 
 
 
  
  if(keyPressed == true) {
  
      if(key == 'o' || key == 'O' ) {
          //give left mouse button the functionality to plant oak trees
          treeTypeToBePlanted = "plantOakTree";
          //makeHeatWave();
      }
      
      if(key == 'i' || key == 'I') {
          //give left mouse button the functionality to plant pine trees
          treeTypeToBePlanted = "plantPineTree";
      }
      
      if(key == 'p'|| key == 'P') {
          //give left mouse button the functionality to plant pineapple trees
          treeTypeToBePlanted = "plantPineappleTree";
      
      }
      
      if( key == 'm' || key == 'M') {
          //give left mouse button the functionality to plant magical trees
          treeTypeToBePlanted = "plantMagicalTree";
      
      }
      
      if(key == 'b' || key == 'B') {
          //give left mouse button the functionality to plant berry trees
          treeTypeToBePlanted = "plantBerryTree";
      
      }
      
      if(key == 'g' ) {
            
           //growOakTree(1);
           growOakTreeSimple();
            
      }
  }
  
  
  if(mousePressed == true  ) {

      if( treeTypeToBePlanted.equals("plantOakTree") ) {
      
          plantOakTree();
          
      }
      
      if( treeTypeToBePlanted.equals("plantPineTree") ) {
      
          plantPineTree();
          
      }
      
      if( treeTypeToBePlanted.equals("plantPineappleTree") ) {
      
          plantPineappleTree();
          
      }
      
      if( treeTypeToBePlanted.equals("plantMagicalTree") ) {
      
          plantMagicalTree();
          
      }
      
      if( treeTypeToBePlanted.equals("plantBerryTree") ) {
      
          plantBerryTree();
          
      }
    
    
    

  }
  
  
}

void plantOakTree() {

   
   strokeWeight(10);
   stroke(102, 51, 0);
   endPty = groundLoc - distance;
   line(mouseX, groundLoc , mouseX, endPty );//change back to mouseX's later
   endPt = new PVector(mouseX, endPty);
  
}

void growOakTreeSimple() {//more promising than the complex one....

    float endPtXForLeft = endPt.x;
    float endPtyForLeft = endPt.y;
    int distForLeft = distance;//temp variables
    
    line(endPt.x, endPt.y, endPt.x + distance/2 , endPt.y - distance/2 );//can this really work?![branch right]
    endPt.x = endPt.x + distance/2;
    endPt.y = endPt.y - distance/2;
    
    line(endPt.x, endPt.y, endPt.x + distance/2, endPt.y );
    line(endPt.x, endPt.y, endPt.x , endPt.y - distance/2);
    
    
    line(endPtXForLeft, endPtyForLeft, endPtXForLeft - distForLeft/2 , endPtyForLeft - distForLeft/2 );//can this really work?![branch left]
    endPtXForLeft = endPtXForLeft - distForLeft/2;
    endPtyForLeft = endPtyForLeft - distForLeft/2;
    
    
    
    //endPt.x +- distance/2 will make the length of the branch half the length of the branch it is from &   
    // branch 45 degrees left or right   
    
    /*line(endPt.x, endPt.y, endPt.x + distance/2 , endPt.y - distance/2 );//can this really work?![branch right]
    endPt.x = endPt.x + distance/2;
    endPt.y = endPt.y - distance/2;
    distance *= 1.5;
    line(endPt.x, endPt.y, endPt.x - distance/2 , endPt.y - distance/2 );//can this really work?![branch left]
    //these 4 lines of code can create interesting branching patterns...
    
    */
    
     
}

/*int copyBranchLv;
int numRotate;
void growOakTree(int branchLevel) {//more complex version in progress..........

    copyBranchLv = branchLevel;
    numRotate = copyBranchLv;
    
    if(branchLevel == 0 ) {
    
        return;
    }
    
    stroke(102,51,0);//brown
  
    pushMatrix();
    
    translate(endPt.x, endPt.y );//goal move origin to endpoint
    
    for( int i = copyBranchLv; i > numRotate - 1 ; i-- ) {
        rotate(-QUARTER_PI);//rotate counter clockwise
    }
    
    numRotate--;
    
    line(endPt.x, endPt.y, endPt.x, endPt.y - distance/2);//draw line & top line[for now];;  0.5 * endPt.y
    growOakTree(branchLevel - 1);
    popMatrix();
    
    pushMatrix();
    
    numRotate = copyBranchLv;//reset for next loop
    
    translate(endPt.x, endPt.y );
    
    for( int i = copyBranchLv; i > numRotate - 1; i-- ) {
        rotate(QUARTER_PI);//rotate clockwise
    }
    
    numRotate--;
 
    line(endPt.x, endPt.y, endPt.x, endPt.y - distance/2);//draw line
    growOakTree(branchLevel - 1);
    popMatrix();
    
    //growOakTree(branchLevel -1);
    //numRotate = copyBranchLv;
    


}*/


void plantPineTree() {



}

void plantPineappleTree() {


}

void plantMagicalTree() {


}

void plantBerryTree() {



}
