
//moving white rect

color col_a= color(255);
color col_b=color(255);
color col_c=color(255);
color col_d=color(255);

void setup(){
 size(400,400); 
}

void draw(){
 int posX=mouseX;
 int posY=mouseY;
 
 background(100);
 stroke(255);
 fill(col_a);
 rect(100,100,100,100);
 fill(col_b);
 rect(200,100,100,100);
 fill(col_c);
 rect(100,200,100,100);
 fill(col_d);
 rect(200,200,100,100);


if(posX <= 200 && posY <= 200){
  col_a= color(255);
}else{
    col_a= color(0);
}

if(posX >= 200 && posY <= 200){
  col_b= color(255);
}else{
    col_b= color(0);
}

if(posX <= 200 && posY >= 200){
  col_c= color(255);
}else{
    col_c= color(0);
}

if(posX >= 200 && posY >= 200){
  col_d= color(255);
}else{
    col_d= color(0);
}




}




 


