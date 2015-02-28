
size(200, 200);
background(0, 0, 255);
fill(255, 255, 0);
textFont(createFont("Times",36));
textAlign(CENTER);
int x=12;
for (int i= 100 ; i<400; i=i+5){
  while (x>0){
    text("Hello world", i, height/x);
    x = x-1;
  }
}

                                
