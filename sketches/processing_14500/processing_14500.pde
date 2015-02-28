
int x;int dir=20;  int a = 600;  

int b = 250;   

int radius = 70; 
void setup(){  
  size(600,600); noStroke();  strokeWeight(15) ;
  x = width/2;

stroke(0,120);
smooth();
  noStroke();
  noStroke();
  fill(255);
}
void draw(){
  background(0);
stroke(255);
  


ellipse(mouseX,mouseY,5,5);
println("X;"+mouseX+"Y;"+ mouseY);
  if ((mouseX >120) && (mouseX <300)&&
  (mouseY > 120) && (mouseY < 300)) {
    fill(175,210,214);
  }else{fill(252,208,161);
  }
  ellipse(300,500,200,200);quad(300,0,320,0,600,320,600,380);
  
  line(40,0,40,600);line(60,0,60,600);rect(0,320,320,20);
   if (mousePressed == true) {
    if(mouseButton == LEFT) fill(75,75,64);  
  else if (mouseButton == RIGHT) 
      fill(183,183,179); 
 } else {
    fill(232,199,230);
 }rect(0,100,600,20);
rect(420,0,80,600);

fill(124,95,122);
ellipse(40,160,40,40);
fill(238,240,174);
ellipse(50,330,20,20);




ellipse(600,600,400,400);fill(205);
ellipse(600,600,300,300); 

ellipse(200,200,200,200);

 //ellipse+++    

float check = dist(a,b,mouseX, mouseY);  

if(check < radius){  

 fill(238,240,174);  

   radius++;  

}else{ fill(124,95,122);}  

ellipse(a,b,radius,radius);  

// moving ellipse  

float ma = constrain(mouseX,240,231);  

float mb = constrain(mouseY,255,285);

textSize(40);  

  fill(70);  

  text("School",5,100);  

  text("Name",220,300);  

  text("Date",390,480);  

  if (keyPressed) {  textSize(10); 

    if( (key == 'S') || (key == 's')) {  
      

      text(":Konkuk",130,100);  

    }  

    if ((key == 'N') || (key == 'n')) {  

      text(":Li Yiran",330,300);  

    }  

    if ((key == 'D') || (key == 'd')) {  

      text(":Oct 27. 2010",480,480);  

    } 
  }

 
}

