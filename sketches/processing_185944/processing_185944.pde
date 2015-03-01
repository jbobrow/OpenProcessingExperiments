
void setup(){
size(640 ,360);
background(#B4551D);
}

void draw(){


fill(#A03219);//1
stroke(4);
rect(0, 0, 78, 360);

fill(#987D6F);//2
rect(40, 0, 78, 360);

fill(#5F4340);//3
rect(128, 0, 45, 360);

fill(#684B39);//4
rect(517, 0, 45, 360);

fill(#E3BBA1);//5
rect(549, 0, 30, 360);

fill(#A03219);//6
rect(630, 0, 60, 360);

stroke(1);
fill(#EBA948, 200);
ellipse(pmouseX,pmouseY, 19, 19);

}

void mousePressed(){
  background(#050505);
}

void keyPressed(){
background(#4E3226);
}
