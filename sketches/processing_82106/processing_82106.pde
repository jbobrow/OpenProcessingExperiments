
void setup (){                                                                                                                                      size();
size(800,800);
background(255);
}

void draw (){
  frameRate(2);
for(int i=0;i<width;i+=10){
for(int a=0;a<width;a+=30){  
  
  fill(random(212),random(56),random(2));
  ellipse(a,i,10,100); //original (a,i,100,100)
    
}  
}
}
                                                                                                                                                                                                           

