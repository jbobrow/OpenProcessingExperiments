
// Sahar Karain
// Processing Sketch

/* ******************** Variables ******************** */
PFont myFont;
int x= 300;
int y= 200;
int p=15;
int e=5;

String m; //The state of the system

/* ******************** Setup ******************** */
void setup()
{
  setupscreen();
  m="start";
  
}

/* ******************** Draw ******************** */
void draw() {

  // This is pretty wasteful with all the repeated if statements... but the idea should be clear.
  
     if(m=="start")
     {
         
       x=x+1;
      stroke(#FAF25B);
       ellipse(x,p,8,8);
       if(x>602){
         x=0;
       }
       ellipse(x,p+555,8,8);
       if(x>602){
         x=0;
       }

 

        
        if(mousePressed&&mouseX>220&&mouseX<370&&mouseY>300&&mouseY<350)
        {
           println("play button was pressed");
           m="menu";
           directions();
        }
     }
     
     if(m=="menu")
     {
        if(mousePressed&&mouseX>200&&mouseX<390&&mouseY>550&&mouseY<595) //We want to color
        {
           println("play button was pressed");
           
           colorscreen();
           m="coloring";
           
          }   
        }

     
     if(m=="coloring")
     {  
        stroke(0);
        fill(255);  //white
        rect(5,5,30,30);
        fill(#F01111); //red
        rect(5,38,30,30);
        fill(#F8FF36);  //yellow
        rect(5,71,30,30);
        fill(#FA1CC3);   //pink
        rect(5,104,30,30);
        fill(#2F3BF7);   //blue
        rect(5,137,30,30);
        fill(#23F52B);   //green
        rect(5,170,30,30);
        fill(#AA1DDE);   //purple
        rect(5,203,30,30);
        fill(#FFB031);   //orange
        rect(5,236,30,30);
        fill(#936822); //brown
        rect(5,269,30,30);
        fill(0);  //black
        rect(5,302,30,30);
        fill(255);
        rect(5,565,60,30);
        fill(0);
        myFont = createFont("CenturyGothic Bold", 20);
        textFont(myFont);
        text("Clear" , 34, 588);
        
        fill(255);
        line(40,0, 40,560);
        line(40,560, 600,560);
        //rect(40,1,555,560);
        colors();
        
        if(keyPressed){
         if(e<250){
          if(keyCode == RIGHT){
            e++;
          }
         }
         if(e>1){
          if(keyCode == LEFT ){
            e--;
          }
        }
        }
        
        if(p==1){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(255);
           fill(255);
           ellipse(mouseX, mouseY, e , e);
          }
        }
        if(p==2){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#F01111);
           fill(#F01111);
           ellipse(mouseX, mouseY, e , e);
          }
        }
        if(p==3){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#F8FF36);
           fill(#F8FF36);
           ellipse(mouseX, mouseY, e , e);
          }
        }
        if(p==4){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#FA1CC3); 
           fill(#FA1CC3); 
           ellipse(mouseX, mouseY, e , e);
          }
        }
        if(p==5){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#2F3BF7);
           fill(#2F3BF7);
           ellipse(mouseX, mouseY, e , e);
          }
        }
        if(p==6){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#23F52B); 
           fill(#23F52B); 
           ellipse(mouseX, mouseY, e , e);
          }
        }
       if(p==7){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#AA1DDE);
           fill(#AA1DDE);
           ellipse(mouseX, mouseY, e , e);
          }
        }
       if(p==8){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#FFB031);
           fill(#FFB031);
           ellipse(mouseX, mouseY, e , e);
          }
        }
       if(p==9){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(#936822); 
           fill(#936822); 
           ellipse(mouseX, mouseY, e , e);
          }
        }
       if(p==10){
          if(mousePressed&&mouseX>40+e/2&&mouseX<595-e/2&&mouseY>1+e/2&&mouseY<561-e/2)
          {
           stroke(0); 
           fill(0); 
           ellipse(mouseX, mouseY, e , e);
          }
        }
       if(p==11){  
           fill(255);
           rect(40,0,560,560);
       }
       }    
   
       
}

/* ******************** Functions ******************** */
void setupscreen()
{
  
   background(#FAF25B);
   size(600, 600); 
   stroke(#9C03FC);
 
   myFont = createFont("AppleCasual", 60);
   textFont(myFont);
   textAlign(CENTER);
   fill(#7123C1);
   text("SAHAR'S A+ SKETCH", x, y);
   
   stroke(255);
   fill(#F540CB);
   rect(220, 300, 150, 50); 
   myFont = createFont("AppleCasual", 40);
   textFont(myFont);
   fill(#7123C1);
   text("play", 295, 333); 
 
}

void directions() {
  background(#2813F0);
   myFont = createFont("CenturyGothic Bold", 70);
   textFont(myFont);
   fill(#FF1755);
   text("DIRECTIONS", 295, 54);
   myFont = createFont("CenturyGothic Bold", 30);
   textFont(myFont);
   fill(#FFF817);
   text("Choose a color from the left to start", 300, 100);
   text("coloring on the canvas. To clear the", 300, 150);
   text("screen, hit the clear button on the", 300, 200);
   text("bottom left-hand corner. To increase", 300, 250);
   text("the size of the brush, hit the right", 300, 300);
   text("arrow key. To decrease the the size", 300, 350);
   text("of the brush, hit the left arrow key.", 300, 400);
   
   stroke(0);
   fill(#9E23C1);
   rect(200, 550, 190, 45);
   fill(#FCBA03);
   text("ENJOY", 295, 586); 
   
}
  

void colorscreen() //Draw the coloring screen
{
           background(255);
}

void colors(){
          
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>5&&mouseY<35)
        {
          p=1;
          println("white");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>38&&mouseY<68)
        {
          p=2;
          println("red");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>71&&mouseY<101)
        {
          p=3;
          println("yellow");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>104&&mouseY<134)
        {
          p=4;
          println("pink");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>137&&mouseY<167)
        {
          p=5;
          println("blue");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>170&&mouseY<200)
        {
          p=6;
          println("green");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>203&&mouseY<233)
        {
          p=7;
          println("purple");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>236&&mouseY<266)
        {
          p=8;
          println("orange");
        }
                
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>269&&mouseY<299)
        {
          p=9;
          println("brown");
        }
                        
        if(mousePressed&&mouseX>5&&mouseX<35&&mouseY>302&&mouseY<332)
        {
          p=10;
          println("black");
        }
                        
        if(mousePressed&&mouseX>5&&mouseX<65&&mouseY>565&&mouseY<595)
        {
          p=11;
          println("clear");
        }
        
} 


  
             
                
