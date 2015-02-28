
// Wictor Hugo - Malha Estudo da Forma
size(200, 200);
for (int j=0; j<25; j++)
  for (int i=0; i<25; i++)
  {
    if (i<=j)
      fill(86,98,4);
    else
      fill(155,66,35);
    rect( i*20, j*20, 18, 18);
  }
