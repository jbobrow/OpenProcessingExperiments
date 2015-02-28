

size(250,250);
background(255,240,251);
smooth();
strokeWeight(.1);
noFill();

int abc=0;
int cba=0;

float d =80;

for (int j=0; j<400; j=j+40) {
  cba=j;
  for (int i=0; i<400; i=i+40) {
   
    abc=i;
    fill(i,mouseX,mouseY,20);
    stroke(255,240,251);
    ellipse(cba,abc,d,d);
  }
}

strokeWeight(15);
stroke(255,39,82,30);
line (30,250,30,0);
line (66,250,66,0);
line (98,250,98,0);
line (128,250,128,0);
line (158,250,158,0);
line (190,250,190,0);
line (225,250,225,0);

line (250,80,0,80);
line (250,40,0,40);
line (250,120,0,120);
line (250,160,0,160);
line (250,200,0,200);



