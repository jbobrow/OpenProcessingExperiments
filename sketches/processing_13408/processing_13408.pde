
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255,197,0);  //set background black   
}

void draw() {  //draw function loops 
//face
noStroke ();
fill (0,10,0);
rect (00, 100, 180, 180);
fill (255,228,181);
ellipse (30, 220, 30, 30);
ellipse (120, 220, 30, 30);
ellipse (90, 220, 120, 120);
//앞머리
fill (0,10,0);
rect (10, 150, 140, 40);
//눈
fill (255);
ellipse (70, 220, 40, 40);
ellipse (110, 220, 40, 40);
fill (0);
ellipse (80, 220, 10, 10);
ellipse (110, 220, 10, 10);
fill (255);
ellipse (110, 220, 60, 10);
fill (250,40,40);
ellipse (90, 260, 20, 30);

//face2
noStroke ();
fill (0,10,0);
ellipse (200, 190, 180, 180);
//귀얼굴
fill (255,228,181);
ellipse (140, 220, 30, 30);
ellipse (260, 220, 30, 30);
ellipse (200, 220, 120, 120);
//앞머리
fill (0,10,0);
rect (130, 150, 140, 40);
//눈
fill (255);
ellipse (220, 220, 40, 40);
ellipse (180, 220, 40, 40);
fill (0);
ellipse (180, 220, 20, 20);
ellipse (220, 220, 20, 20);
//입
fill (170,40,43);
rect (175, 250, 50, 20);
fill (255);
rect (190, 250, 20, 10);




   
}

                
                
