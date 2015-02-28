
size(400, 400);
background(60, 80, 100);
smooth();

//define first variables
int a = 25;
int b = 25;

//begin nested for loop (ellipse)
for(int i = -17; i <= 400; i += 40){
  for(int j = -17; j <= 400; j += 40){
    fill(152, 19, 94);
    ellipse(i, j, a, b);
  }
}

//begin nested for loop (rect)
for(int k = 0; k <= 400; k += 20){
  for(int l = 0; l <= 400; l += 20){
    fill(255, 65);
    rect(k, l, a, b);
  }
}



