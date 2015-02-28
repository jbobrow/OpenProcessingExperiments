
void setup(){
 size(250,250); 
}

void draw(){
  for (int i=0; i<250; i++)
    for(int j=0; j<250; j+=2)
     set(int(random(i)*j), (i>>j)+int(random(100)), i>>j);
 if (mousePressed)noLoop();
}
