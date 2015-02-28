
size(250,250);
background(#765C8F);
smooth();

fill(#372B43); // dark purple band with transparent boxes to make it seem fuzzy
noStroke();
rect(0,135,250,90);
fill(#372B43,175);
rect(0,132,250,96);
fill(#372B43,125);
rect(0,129,250,102);
fill(#372B43,75);
rect(0,126,250,108);
fill(#372B43,25);
rect(0,123,250,114);

//  waves start here

stroke(255);
fill(255,30);
for(int a = 0; a < 270; a += 20)
{arc(a,142,20,10,0,PI);
}
for(int b = 10; b < 270; b += 20)
{arc(b,152,20,10,0,PI);
}
for(int c = 0; c < 270; c += 20)
{arc(c,162,20,10,0,PI);
}
for(int d = 10; d < 270; d += 20)
{arc(d,172,20,10,0,PI);
}
for(int e = 0; e < 270; e += 20)
{arc(e,182,20,10,0,PI);
}
for(int f = 10; f < 270; f += 20)
{arc(f,192,20,10,0,PI);
}
for(int g = 10; g < 270; g += 20)
{arc(g,202,20,10,0,PI);
}
for(int h = 0; h < 270; h += 20)
{arc(h,212,20,10,0,PI);
}


stroke(255,100);
fill(255,50);

for(int i = 0; i < 270; i += 10)
{arc(i,148,10,6,0,PI);
}
for(int j = 0; j < 270; j += 10)
{arc(j,168,10,6,0,PI);
}
for(int k = 0; k < 270; k += 10)
{arc(k,188,10,6,0,PI);
}
for(int l = 0; l < 270; l += 10)
{arc(l,208,10,6,0,PI);
}



