
//Math 2 - Curves
//Exercise #3
/*3. Compose a range of gradients created from curves.*/

size (400,400);
background(255);
for (int x = 0; x <400; x ++){
 float n = norm(x, 0.0, 400);
float y = pow(n,2);
y *= 400;

stroke(y);
line(x,y,x,400);
stroke(400-y);
line(x,y,x,0);
}


