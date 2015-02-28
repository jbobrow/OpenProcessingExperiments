
void setup() 


{ 
background(255); 
size(450,450); 
strokeWeight(4); 
stroke(0,050); 
smooth(); 
} 


void draw() 
{ 
switch(key){ 

case 's': 
save("bild.png"); 
break; 

default: 
stroke(0,50); 
} 



if(mousePressed){ 
float d = dist(mouseX, mouseY, pmouseX, pmouseY); 

line(mouseX,mouseY, pmouseX, pmouseY); 
strokeWeight(d); 

} 

}
