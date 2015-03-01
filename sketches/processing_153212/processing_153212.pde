
int paikkax, paikkay,kasvattaja,ravistaja;

void setup(){
size(1000,1000);
background(0);
paikkax=0;
paikkay=0;
kasvattaja=1;
ravistaja=1;
}

void draw(){
 background(0);
 while (paikkay<height) {
   while (paikkax<width) {
   rect(paikkax+random(0,ravistaja),paikkay+random(0,ravistaja),1+kasvattaja,1+kasvattaja);
   paikkax=paikkax+50;
   }
   paikkay=paikkay+50;
   paikkax=0;
 }
 paikkax=0;
 paikkay=0;
 kasvattaja=mouseX/10;
 ravistaja=mouseY/10;
}
