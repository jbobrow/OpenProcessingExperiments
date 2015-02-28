
//James LeVasseur
//1-17-14
//James LeVasseur's improvements of Eric Morrison's face project.
//NOTE: All comments in the code made by James will start with "J-"



Headr face1; //J- declares a new Headr object face1

float midx, midy; //J- declares two floats

String numb; //J- declares a String

boolean Warhol,check1,check2; //J- declares booleans

ArrayList <Headr> Port; //J- declares a new ArrayList of the class Headr

color skin,hair,blue,pink,redd,green,yellow,purple,orange,cyan,black,white; //J- declares new colors

void setup() {
  size(500, 500);
  
  //J- initialize different color variables for coloring the image
  skin = color(238,203,176); 
  hair = color(221,193,103);
  blue = color(0,0,255);
  pink = color(255,122,253);
  redd = color(255,0,0);
  green = color(0,255,0);
  yellow = color(255,255,122);
  purple = color(187,77,255);
  orange = color(245,177,20);
  cyan = color(20,245,222);
  black = color(0);
  white= color(255);
  
  numb = "1"; //J- initialize string used for Warhol effect
  
  Warhol = false; //J- initialize boolean for the Warhol effect
  check1=false; //J- initialize boolean used with Warhol effect
  check2=true; //J- initialize boolean used with Warhol effect
  
  //J- initialize floats that will be used to represent half the screen
  midx = width/2;
  midy = height/2;
  
  //J- initilizes Port as a new Headr ArrayList
  Port= new ArrayList<Headr>();
  
  //J- moved bulk of code from setup to a class
  
}
 
void draw() {
  
  background(255); //J- moved background into draw
 
  if(Warhol==false && check1==false){ //J- this and the following if statement are used for differing between regular mode and warhol mode, multiple conditions to prevent too many heads from being created
    Port.clear(); //J- clears the Port ArrayList so as to prefvent too many heads from being added
    Port.add(new Headr(white,skin,hair,1,0)); //J- runs a makeHead() function from the Headr class
    check1 = true;//J- makes check1 true to prevent too many heads from being added to Port same as below with check2
  } else if(Warhol==true && check2==false){
    Port.clear();
    
    
    Port.add(new Headr(orange,cyan,pink,2,1));//J-  adds four heads for Warhol mode
    Port.add(new Headr(redd,yellow,green,2,2));
    Port.add(new Headr(pink,redd,orange,2,3));
    Port.add(new Headr(green,purple,blue,2,4));
    check2=true;//J- same as check1 but for this if statement
  }
  
  for(int i = 0;i<Port.size();i++){//J- loops through Port as many time as it is large
    Headr pics = (Headr) Port.get(i); //J- makes "pics" equal to whatever object that is currently being used by the for loop
    pics.makeHead(); //J- uses the makeHead() function from the current object that pics is assigned to be
  }
  
  //J- moved conditionals mentioned about to the Headr class makeHead function
  //J-removed if(true) statement, was unecessary.
  //J- moved mouth line into Headr makeHead functyion class
  //J-removed ellipse around mouth, uneeded

 

  fill(0);//J- fill used for text below
  text("Press W to enter Warhol mode, Up and Down arrows for smiling or frowning\n Press S to Stop Warhol mode,\n Click and hold the mouse to drag the face(s)",10,10); //J- intructions

}

void keyPressed(){ //J- keyPressed function used for differing between warhol and regular mode
 
 if(key=='w'){ //J- checks for w pressed
  Warhol=true; //J- activates warhole mode variable
  check2=false; //J- sets check2 to true so that both conditions are met for Warhol if statement above mode
 }
 if(key=='s'){ //J- checks for s pressed
  Warhol=false; //J- stops warhol mode by setting this variable to false, which also is one of the checks for regular mode
  check1=false; //J- sets check1 to false which is the second condition for the regular head to be added to Port
 }
}

/////////CLASS HEADR STARTS HERE//////////
/////////////////////////////////////////
class Headr{ //J- class Headr starts
 float midx,midy,bgx,bgy,scale; //J- declares variables that will be used in the Headr class
 int pos,modx,mody;
 color backg,skinc,hairc;


 
//////HEADR CONTSTRUCTOR///////
 Headr(color backgp,color skincp,color haircp,float scalep,int posp){ //J- backgp the background color for the head portrait, skincp is the skin color for any portrait, haircp is the hair color for the portrait. Scalep is the scaling of the image, posp is referring the position of the portrait. the p's in these variables stand for "parameter" 
    //J- sets the parameters to variables to class variables
    pos = posp;
    backg = backgp;
    skinc = skincp;
    hairc = haircp;
    scale = scalep;
    //J- this class also has midx and midy variables
    midx = width/2;
    midy = height/2;
    


    
  
 } 
  
  void makeHead(){//J- start make head
    
    if(pos==1){//J- all following if statements are for head/bg scaling
       modx=0; //J- modx and mody modify the position of the portrait on the screen. 1 = top left, 2 = top right, 3 = lower left, 4 bottom right
       mody=0;
    } else if(pos==2){
       modx=500;
       mody=0;
    }
    else if(pos==3){
       modx=0;
       mody=500;
    } else if(pos==4) {
       modx=500;
       mody=500;
    }
    //J-replaced many things dealing with width or height (and some associated values such as /2) with midx & midy variables
    
    if(mousePressed){ //J- if statement for moving the heads in relation to the mouse
     midx = mouseX; //J- sets midx and midy to mouseX and mouseY so that the head follows the mouse
     midy = mouseY;
    } else {
     midx = width/2+modx; //J- if the mouse isn't pressed then midx and midy are set to these values, modified by modx and mody for positioning
     midy = height/2+mody; 
    }
    //J- the following four lines are all setup for the background positions of the portrait
    bgx=(midx*2+20);
    bgx=bgx-(bgx+10)+modx;
    bgy=(midy*2+20);
    bgy=bgy-(bgy+10)+mody;
    
    noStroke(); //J- for background
    fill(backg); //J- for background fill
    rect(bgx/scale,bgy/scale,520/scale,520/scale);//J- background of each head
    
    
    //J- Added variables to much of the original code for mouse moving and general convenience of manipulation, formatted code for scaling, labelled everything for easier navigation
    smooth(); //J- smooths out head

    fill(skinc); //J- for main head and neck fill
    strokeWeight(3/scale);//J- for main head
    noStroke();//J- for neck fill
    rect((midx-80)/scale,midy/scale,160/scale,250/scale); //J- neck fill in
    stroke(0); //for main head
    ellipse( midx/scale, midy/scale, 300/scale, 400/scale); //J- main head ellipse
    
    noStroke();//J- for hair arcs
    fill(hairc);//J- for hair arcs

    arc(midx/scale,(midy-35)/scale,280/scale,325/scale,PI,TWO_PI);//J- hair color arc main

    arc((midx-125)/scale,(midy-35)/scale,30/scale,130/scale,PI,TWO_PI); //J- left hair color arcs
    arc((midx-130)/scale,(midy-35)/scale,30/scale,90/scale,PI,TWO_PI);
    
    arc((midx+125)/scale,(midy-35)/scale,30/scale,130/scale,PI,TWO_PI);//J- right hair color arcs
    arc((midx+130)/scale,(midy-35)/scale,30/scale,90/scale,PI,TWO_PI);
    
    


    strokeWeight(3/scale);//J- for main head cover
    stroke(0);//J- for main head cover
    noFill(); //J- for main head cover
    ellipse(midx/scale,midy/scale,300/scale,400/scale);//J- transparent head ellipse to cover hair color flooding
    

    fill(skinc);//J- skin color
    line((midx-80)/scale, (midy+250)/scale, (midx-80)/scale, (midy+250-78)/scale);//J- left neckline
    line((midx+80)/scale, (midy+250)/scale, (midx+80)/scale, (midy+250-78)/scale);//J- right neckline
    strokeWeight(10/scale); //J- for glasses
    rect((midx+20)/scale, (midy-50)/scale, 110/scale, 80/scale, 10/scale, 0/scale, 20/scale, 50/scale); //J- right glasses
    rect((midx-20-110)/scale, (midy-50)/scale, 110/scale, 80/scale, 0/scale, 10/scale, 50/scale, 20/scale); //J- left glasses
    rect((midx-150)/scale, (midy-50)/scale, 20/scale, 10/scale, 0/scale, 0/scale, 0/scale, 10/scale); //J- left glasses mini rect
    rect((midx+150-20)/scale, (midy-50)/scale, 20/scale, 10/scale, 0/scale, 0/scale, 10/scale, 0/scale); //J- right glasses mini rect
    strokeWeight(20/scale); //J- for following line
    line((midx-15)/scale, (midy-30)/scale, (midx+15)/scale, (midy-30)/scale);//J- line connecting glasses
    strokeWeight(10/scale);//J- for eyes
    fill(0); //J- for eyes
    ellipse((midx-70)/scale, (midy-10)/scale, 4/scale, 9/scale);//J- left eye
    ellipse((midx+70)/scale, (midy-10)/scale, 4/scale, 9/scale);//J- right eye
    strokeWeight(3/scale); //J- for eyelids,brows,nose
    noFill(); //J- for eyelids,brows,nose
    arc((midx-60)/scale, (midy-2)/scale, 80/scale, 40/scale, PI+QUARTER_PI, PI+HALF_PI); //J- left eyelid/brow
    arc((midx+60)/scale, (midy-2)/scale, 80/scale, 40/scale, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); //J- right eyebrow
    arc((midx-15)/scale, (midy+95)/scale, 20/scale, 40/scale, PI+QUARTER_PI, PI+HALF_PI); //J- left nose curve
    arc((midx+15)/scale, (midy+95)/scale, 20/scale, 40/scale, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); //J- right nose curve
    ellipse((midx-10)/scale, (midy+90)/scale, 10/scale, 3/scale);//J- left nostril
    ellipse((midx+10)/scale, (midy+90)/scale, 10/scale, 3/scale);//J- right nostril
    line((midx-15)/scale, (midy+60)/scale, (midx-15)/scale, (midy+30)/scale); //J- nose line
    fill(255); //J- for glasses circles
    stroke(255); //J- for glasses circles
    strokeWeight(1/scale); //J- for glasses circles
    ellipse((midx-145)/scale, (midy-45)/scale, 10/scale, 3/scale);//J- left white glasses circle
    ellipse((midx+145)/scale, (midy-45)/scale, 10/scale, 3/scale);//J- right white glasses circle
    strokeWeight(2/scale); //J- for hair lines
    stroke(0); //J- for hair lines
    noFill(); //J- for hair lines
    arc((midx+50)/scale, (midy-150)/scale, 50/scale, 200/scale,0, HALF_PI); //J- hair lines
    arc((midx-100)/scale, (midy-150)/scale, 350/scale, 200/scale, 0, HALF_PI); //J- hair lines
    arc((midx-150)/scale, (midy-150)/scale, 450/scale, 200/scale, 0, HALF_PI); //J- hair lines
    arc((midx+40)/scale, (midy-60)/scale, 300/scale, 200/scale, PI, PI+HALF_PI); //J- hair lines
    arc((midx+40)/scale, midy/scale, 250/scale, 300/scale, PI+QUARTER_PI, PI+HALF_PI); //J- hair lines
    
    stroke(0); //J- for mouth
    line((midx-30)/scale, (midy+130)/scale, (midx+30)/scale, (midy+130)/scale); //J- mouth line
    
    //conditionals deciding whether to smile or frown based on arrows
   if (keyPressed) { 
    if (keyCode == UP) {
      strokeWeight(3*10/scale); //J- for the line that covers the mouth, made extra thick so it covers the original mouth line thuroughly
      stroke(skinc); //J- for the line covering mouth

      line((midx-30)/scale, (midy+130)/scale, (midx+30)/scale, (midy+130)/scale); //J- line that covers mouth while smiling so that following smiling/frowning arc is the only mouth seen
      stroke(0); //J- for smiling arc
      strokeWeight(3/scale); //J- for smiling arc
      noFill();//J- for smiling arc
      arc(midx/scale, (midy+120)/scale, 60/scale, 30/scale, 0, PI);//J- smiling arc
    }
 
    else if (keyCode == DOWN) { 
      strokeWeight(3*10/scale); //J- for the line that covers the mouth, made extra thick so it covers the original mouth line thuroughly
      stroke(skinc); //J- for the line covering mouth
     
      line((midx-30)/scale, (midy+130)/scale, (midx+30)/scale, (midy+130)/scale);//J- line that covers mouth while smiling so that following smiling/frowning arc is the only mouth seen
      stroke(0);//J- for frowning arc
      strokeWeight(3/scale);//J- for frowning arc
      noFill();//J- for frowning arc
      arc(midx/scale, (midy+140)/scale, 60/scale, 30/scale, PI, TWO_PI);//J- frowning arc
    }
  }
  }
  
}



