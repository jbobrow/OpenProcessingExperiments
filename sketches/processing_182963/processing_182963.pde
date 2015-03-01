

//
size(333, 300);

//fyrst tharf ad skilgreina breytu
int staerd;  //int er heiltala
float innri; //float er tala med aukastofum

//svo tharf ad gefa breytunni gildi
staerd = 30;  
innri = 0.7;

//thad er lika haegt ad gera baedi i einu
int x = 22;
int y = 111;

background(111, 0, 1);

//endurtekningar, ekki gott... :(
ellipse(x, y, staerd, staerd);
ellipse(x, y, staerd*innri, staerd*innri);

ellipse(x+50, y, staerd, staerd);
ellipse(x+50, y, staerd*innri, staerd*innri);

ellipse(x+100, y, staerd, staerd);
ellipse(x+100, y, staerd*innri, staerd*innri);

y = 188;

//betra ad nota FOR lúppu

// for(breytuskilgreining, ástandsskoðun, aðgerð)
for (int i=0; i<333; i=i+40) {
  ellipse(x+i, y, staerd, staerd);
  ellipse(x+i, y, staerd*innri, staerd*innri);
  println(i);
}


// til ad telja upp i 10
for (int i=0; i<10; i++) {
  print(i);
  print(" ");
}
// i++ er það sama og i=i+1

y = 240;

for (int i=0; i<333; i=i+50) {
  ellipse(x+i, y, staerd, staerd);
  ellipse(x+i, y, staerd*innri, staerd*innri);
  if(i>100) {
   fill(34,222,0); 
  } else {
    fill(0,0,255);
  }
}


