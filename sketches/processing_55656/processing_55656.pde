
background (255);
size (250,250);
smooth();
for(int a = 10; a < 120; a += 20) { 
  //1st quadrant
  line (125, a, a+130, 125);
  //2nd quadrant
  line (125, a+130, a, 125);
  //3rd quadrant
  line (125, -a+120, a, 125);
  //4th quadrant
  line (125, 250-a, a+130, 125);
}
