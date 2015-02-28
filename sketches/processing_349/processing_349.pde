
//carolina vallejo

int rojos[];
int verdes[];
int azules [];

void setup(){
  rojos = new int[10];
  verdes = new int[10];
  azules = new int[10];
   for (int i = 0; i < 10; i++){
     rojos[i] = (int)random(0,255);
     verdes[i] = (int)random(0,255);
     azules[i] = (int)random(0,255);
   }
  
  size (300,200);
}

void draw(){
 noStroke();
 for (int i = 0; i < 10; i++){
    fill(rojos[i],verdes[i],azules[i]);
    rect(i*25+25,50,20,20); 
 }
}

void mousePressed(){
   for (int i = 0; i < 10; i++){
     rojos[i] = (int)random(0,255);
     verdes[i] = (int)random(0,255);
     azules[i] = (int)random(0,255);
   }
}

