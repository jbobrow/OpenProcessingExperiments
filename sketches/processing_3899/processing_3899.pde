
//coding borrowed from tRoom by corneel cannaerts

PImage i;
int c=0;

void setup(){
 size(500,500);
 smooth();
}
 
void draw(){
 i=get();
 tint(250);
 image(i,1,2,496,495);
 if(c%69>9&&c%69<40)ellipse(0, 250, 100, 250);
 line(496,99,495,300);
 if(c%69>9&&c%69>40)rect(100,425,150,10);
 if(c%69>9&&c%69>40)rect(250,280,10,200);
 if(c%69>9&&c%69>40)rect(100,425,10,50);
 c++;
}

