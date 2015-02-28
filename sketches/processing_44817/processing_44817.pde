
void setup(){

size (500,500);
background(255);
smooth();

}

void draw(){

//float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
//strokeWeight(weight);
//line(mouseX, mouseY, pmouseX, pmouseY);

//ellipse(mouseX,mouseY,10,10);

if(mousePressed == true){
  line(pmouseX,pmouseY,mouseX,mouseY);
    ellipse(mouseX,mouseY,random(100),random(100));
    fill(0,0,0,40);
    stroke(random(3));
    line(pmouseX,pmouseY,pmouseX,mouseY);    
}else{
    ellipse(mouseX,mouseY,random(100),random(100));
    fill(255,255,255,30);
}
}

