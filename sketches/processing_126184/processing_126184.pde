
void setup(){
size (320,200);
background(0);
}
void draw(){
for (int x = 0; x<width; x++){
  for(int y = 0; y<height; y++){

    if(y%2==0)continue;
    if(x%2==0){
        rect(x*10+10,y*10,10,10);
    }
    else{
        rect(x*10+10,y*10,4,10);
    }
    fill(random(255),random(255),random(255));
    noStroke();
  }
 }
}



