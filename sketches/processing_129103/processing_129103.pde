
float Puck_x = 0; //Variable of the puck on x
float plus_minus_x = 1; //Float for X wall boundaries
float Puck_y = 0; //Variable of the puck on y
float plus_minus_y = 1; // Float for Y wall boundaries
float Puck_Size = 7; //Puck size
float Bwidth = 2.5; // Bat width
float Bheight = 90; // Bat height
float B_x = 750; // Bat x axis position
float B_y = 300; // Bat y axis position
float puckspeed = 3; // Speed of puck

void setup(){ 
  size(800,600); // Size of the window
  smooth(); // Sets all animation to smooth
  
// Sets all shapes to centre
ellipseMode(CENTER); 
rectMode(CENTER);
}

void draw() {
  background(0);//Set background to black
  
//Ball

stroke(240,232,7);//Colour of Stroke
strokeWeight(20); // Stroke weight of pcuk
ellipse(Puck_x,Puck_y,Puck_Size,Puck_Size);//Puck dimensions



Puck_x = Puck_x + plus_minus_x * puckspeed; //Movement arguement of puck x axis
if (Puck_x > width - Puck_Size/2){
  plus_minus_x = -1;
}
if (Puck_x < 0 + Puck_Size/2){
  plus_minus_x = 1;
}

Puck_y = Puck_y + plus_minus_y * puckspeed; //Movement arguement of puck y axis
if (Puck_y > height - Puck_Size/2){
  plus_minus_y = -1;
}
if (Puck_y < 0 + Puck_Size/2){
  plus_minus_y = 1;
}

Puck_y = Puck_y + plus_minus_y * puckspeed; // Puckspeed arguement

//If puck is left of the bat
if (Puck_y - Puck_Size/2 <= B_y + Bheight/2 //Argument so that the punk bounces of the bat
    && Puck_y + Puck_Size/2 >= B_y - Bheight/2
    && Puck_x + Puck_Size/2 <= B_x - Bwidth/2
    && Puck_x + Puck_Size/2 >= B_x - Bwidth/2 - puckspeed) {
    plus_minus_x = -1;
    
    }
  
//Bat 1

stroke(3,59,255); //Colour of stroke
rect(B_x,B_y,Bwidth,Bheight);//Creates rectangle

if (keyPressed) {
  if (key == 'w') {
    B_y = constrain(B_y - 10,100,500);
  }
  if (key == 's') {
    B_y = constrain(B_y + 10,100,500);
  }
  
}

}


