

int x = 240; //X-coordinate
int y = 370; //Y-coordinate
int tallness = 10;
void setup(){

  size(480,400);
  smooth();
}
 
 void draw(){
   background (140);
   
   
    //rink
   fill(0,168,227);         //blue
   rect(0, 0, width, 200); //sky
   fill(255);             //white
   rect(0,200,width, 150); //white wall
   rect(0, 350, width, 50); //ice
  
   fill(255,98,103);//red
   rect(0,200,width, 10); //red wall
   fill(255,243,0);
   rect(0,320,width, 30); //yellow wall
   
   stroke(255,98,103);
   fill(255);
   ellipse(100, 400, 200, 60); //left hockey circle
   ellipse(380, 400, 200, 60); //right hockey circle
   
   
   //movement
   if((key=='s') || (key=='S')){
     x+=3;
     println("bingo");
   }
    if((key=='a') || (key=='A')){
      x-=3;
    }
    
     if((key=='z') || (key=='Z')){
     y+=3;
     println("bingo");
   }
    if((key=='Q') || (key=='q')){
      y-=3;
    }
     if((key=='k') ||(key=='K')){
     tallness +=3;
   }
    if((key=='l') ||(key=='L')){
      tallness-=3;
    }
   
 //neck
 strokeWeight(2);
 stroke(0);
  fill(255,240,229);
  rect(x+33,y-255-tallness,15, 20);
   
  //hair
  strokeWeight(2);
  stroke(155,96,0);
  fill(90,51,0);
   arc(x+65,y-250-tallness, 75, 165, PI, TWO_PI+0.16); //hurr
  arc(x+35,y-250-tallness, 110, 175, 2.98, TWO_PI-1.10); //hurr
  
 //head
 stroke(0);
  fill(255,240,229);
  ellipse(x+40,y-290-tallness, 80,80); //face

strokeWeight(4);
stroke(93,3,0);
  fill(216,255,250);
  rect(x, y-310-tallness, 35,25);//left glass
  rect(x+45, y-310-tallness, 35, 25);//right glass
  line(x+35, y-300-tallness, x+45, y-300-tallness); //bridge
 
 strokeWeight(2);
stroke(0); 
  
  fill(0);
 ellipse(x+20,y-300-tallness, 3, 3);//left pupil
 ellipse(x+65,y-300-tallness, 3, 3);//right pupil
 line(x+10, y-278-tallness, x+70, y-278-tallness); //mouth
 line(x+10,y-280-tallness,x+10,y-275-tallness);//mouth left side
 line(x+70,y-280-tallness,x+70,y-275-tallness);
 
 //earrings
 fill(255);
 ellipse(x-2,y-275-tallness,10,10);
 ellipse(x+82,y-275-tallness,10,10);
 
 //body
 //arms
 fill(50,183,148);
 rect(x+15, y-240-tallness, 10,100);//left
 rect(x+55, y-240-tallness, 10,100);//right
 
 
 //top
 fill(50,183,148);
rect(x+25, y-240-tallness, 30, 90);
 

//body
//bottom(legs)
stroke(55,88,216);
fill(2,19,82);
 rect(x+25, y-150-tallness, 30, 140+tallness);
 line(x+40, y-120-tallness, x+40, y-20);
 
  //hands
  stroke(0);
 fill(255,240,229);
 ellipse(x+20, y-140-tallness,10,30);//left
 ellipse(x+60, y-140-tallness,10,30);//right
 //thumbs
 ellipse(x+20, y-145-tallness,10,15);//left
 ellipse(x+60, y-145-tallness,10,15);//right
 
 //shoe rectangles
 stroke(0);
 fill(255);
 rect(x-10,y-20,50,10);
  rect(x+40,y-20,50,10);

 //rounded shoes
 fill(255);
 arc(x+15,y-17,50,40, PI,TWO_PI);
 arc(x+65,y-17,50,40, PI,TWO_PI);
 
 //blades
 line(x-20,y,x+40, y);
line(x+100,y,x+40, y);//left blade
line(x+85,y-10,x+85, y);//right blade
line(x+45,y-10,x+45, y);
line(x+35,y-10,x+35, y); 
line(x-5,y-10,x-5, y);
//right
line(x+65,y-35,x+60, y-25);//laces
line(x+75,y-35,x+70, y-25);//laces
line(x+60,y-35,x+65, y-25);//laces
line(x+70,y-35,x+75, y-25);//laces
//left
line(x+15,y-35,x+10, y-25);//laces
line(x+25,y-35,x+20, y-25);//laces
line(x+10,y-35,x+15, y-25);//laces
line(x+20,y-35,x+25, y-25);//laces


print(x);
print(" | ");
println(mouseX);

 }


