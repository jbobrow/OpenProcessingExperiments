
/*
int x =constrain(35,10,90);
int y =constrain(50,10,90);  
int z=constrain(91,10,90);
*/

int x = 525;
int y = 605; 
int radius = 70;


void setup(){
 size(600,600);  
 background(255,220,100);
  smooth();
 noStroke(); 
}


   
void draw(){

//cros1
fill(150,30,95);  
beginShape();  
 vertex(0,0);  
 vertex(220,0);  
 vertex(220,10);  
 vertex(80,10);  
 vertex(80,140);  
 vertex(0,140);  
 vertex(0,0);  
endShape();  


//cross2 
beginShape();  
fill(50,9,8);  
 vertex(0,100);  
 vertex(60,100);  
 vertex(60,160);  
 vertex(120,160);  
 vertex(120,220);  
 vertex(60,220);  
 vertex(60,280);  
 vertex(0,280);  
endShape();  

//r
 fill(14,8,90);
 if((keyPressed == true) && (key == 'a')) {
       
     beginShape();  
 vertex(80,10);  
 vertex(160,10);  
 vertex(160,45);  
 vertex(130,45);  
 vertex(130,80);  
 vertex(80,80);  
 vertex(80,10);  
endShape(); 
  } else { 
    
     beginShape();  
 vertex(100,20);  
 vertex(160,20);  
 vertex(160,40);  
 vertex(120,40);  
 vertex(120,80);  
 vertex(100,80);  
 vertex(100,20);  
 endShape();  
}  
 
//rect1
fill(150,98,40);  
rect(130,45,296,170);  
 
//1 
fill(160,60,36);  
beginShape();  
 vertex(240,100);  
 vertex(250,120);  
 vertex(560,0);  
 vertex(510,0);  
 vertex(240,100);  
endShape();  
//1 in rect1   
fill(0);  
beginShape();  
 vertex(240,100);  
 vertex(250,120);  
 vertex(425,53);  
 vertex(425,45);  
 vertex(390,45);  
 vertex(240,100);  
endShape();  

//2
fill(250,50,90);  
quad(360,100,425,80,435,120,370,140);  
//2 in rect1
fill(30,10,2);  
quad(360,100,425,80,425,123,370,140);  
   
//3   
fill(110,50,90);  
quad(340,160,600,100,603,110,343,170);  
//3 in rect1
fill(50,15,25);  
quad(340,160,425,140,425,151,343,170);  





//ellipse+++  
float check = dist(x,y,mouseX, mouseY);
if(check < radius){
  fill(120,50,10);
   radius++;
}else{ fill(255);}
ellipse(x,y,radius,radius);


//rect and moving ellipse
float mx = constrain(mouseX,415,525);
float my = constrain(mouseY,255,285);
 fill(100,0,0);  
 rect(400,240,140,60); 
 fill(255);
 ellipse(mx,my,30,30);
 
 
fill(56,0,50);  
quad(260,360,445,300,560,460,382,670);  

//
fill(0,255,3);  
ellipse(570,150,20,20);  

}

