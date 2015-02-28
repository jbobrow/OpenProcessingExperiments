

// 1) i am representing a suprised emotion
void setup (){
background (0);
smooth();
size (300, 300);
}
//------------------------------------------------------------------------
void draw (){
//head
smooth();
fill(247, 208, 122);
ellipse(150, 100, 200, 200);

//eyes
fill (255);
ellipse (100, 50, 75, 75);
smooth();
ellipse(200, 50, 75, 75);
//pupils
smooth();
fill (0, 0, 0);
ellipse (100, 50, 40, 40);
ellipse (200, 50, 40, 40);


//nose
fill (0);
ellipse (150, 90, 40, 40);
ellipse (150, 100, 40, 40);
//mouth
fill (255, 255, 255);
ellipse (150, 150, 40, 40);

}
//---------------------------------------------------------------------------




