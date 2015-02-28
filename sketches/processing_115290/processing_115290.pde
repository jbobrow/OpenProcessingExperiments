
void setup(){
  //setting background/screen size and colour
    size(600,600);
    background(0);
}

//Defining a global vairable for if the mose is being held
  boolean mouse = false;
 
void draw(){
  
 //Background random generation of dots ('static') 
 
   //Creates an infinant loop that allows the dots to be generated & regenerated
     for(int i=0; i<1000; i++){
        strokeWeight(random(2));
      //Randomizes colour's of each dot/pixel
        stroke(random(150),random(150),random(150));
      //Randomizes position of colour
        point(random(width), random(height));
     }
   
 //creates the 'planet' in the middle
   fill(0,0,0,15);
   rect(0,0,600,600);
     //defines the thickness of the ellipses
        strokeWeight(2);
        stroke(random(255),random(255), random(255),255);
      ellipse(300,300,random(200),random(200));
  
  //if mouse vairable = true then this code is implimented to make the rocket appear & follow mouse
    if(mouse==true){
      //Defines the colour and propertices of the objects that make up the rocket
         fill(191,13,161);
         strokeWeight(1);
         stroke(0);
      //creates pocket shape through positioning of shapes by co-ordinates
        //Top of rocket
          triangle(mouseX-7,mouseY+15,mouseX, mouseY,mouseX+7,mouseY+15);
        //Rocket body
          rect(mouseX-7,mouseY+15,15,20);
        //Rocket wings
          triangle(mouseX+7,mouseY+30,mouseX+15,mouseY+30,mouseX+7,mouseY+19);
          triangle(mouseX-7,mouseY+30,mouseX-15,mouseY+30,mouseX-7,mouseY+19);
        //Defines properties of pokedots on rocket
          strokeWeight(6);
          stroke(60,240,73);
        //Defines the positioning of pokedots on the rocket
          point(mouseX-3, mouseY+25);
          point(mouseX+3, mouseY+19);
          point(mouseX+1, mouseY+31);
     }
 }
 
//Sets the boolean to true if the mouse is being held making the rocket appear 
  void mousePressed(){
    mouse = true;
}

//Sets the boolean to true if the mouse is being held keeping the rocket hidden
  void mouseReleased(){
    mouse = false;
}

