
int [] numbers = {20,50,70};

void setup(){
size (600,600);
background(0);
}

void draw(){


//float weight= dist(pmouseX,pmouseY,mouseX,mouseY);
//strokeWeight(weight);
stroke(255);
line(mouseX,mouseY,pmouseX,pmouseY);
}

void keyPressed(){
 if(key=='a'){
  fill(210,0,0);
   ellipse(mouseX,mouseY,40,40);
 }

}



//void buttonPressed (){
//if(mouseButton==LEFT){
 // rect(mouseX,mouseY,numbers[1],numbers[2]);
//}
//}





