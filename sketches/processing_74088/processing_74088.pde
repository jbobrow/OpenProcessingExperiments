
size(400, 400);
background(255, 230, 0);
stroke(255);
strokeWeight(10);


int b = 20;

for (int a = 40; a <= 360; a= a+40){
    fill(0, 0, 0, b);  
    ellipse(a, 40, 80, 80); 
    b = b+20;
}

int c = 180;

for (int a = 40; a <= 360; a= a+40){
    fill(0, 0, 0, c);  
    ellipse(a, 120, 80, 80); 
    c = c-20;
}

int d = 20;

for (int a = 40; a <= 360; a= a+40){
    fill(0, 0, 0, d);  
    ellipse(a, 200, 80, 80); 
    d = d+20;
}

int e = 180;

for (int a = 40; a <= 360; a= a+40){
    fill(0, 0, 0, e);  
    ellipse(a, 280, 80, 80); 
    e = e-20;
}

int f = 20;

for (int a = 40; a <= 360; a= a+40){
    fill(0, 0, 0, f);  
    ellipse(a, 360, 80, 80); 
    f = f+20;
}
