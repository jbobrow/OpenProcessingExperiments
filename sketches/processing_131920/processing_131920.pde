
size (300, 300);
background (255, 153, 153);

stroke(255);
strokeWeight(.8);
for(int k=35; k<=55; k=k+5)
{line (0,k,300,k);
}
stroke (102, 255, 255);
noFill();
strokeWeight(3);
for(int i=20; i<=60; i=i+10)
{ellipse(180,200, i, i);
}
for(int j=300; j<=400; j=j+10)
{line (0, j,299, 0);
}
