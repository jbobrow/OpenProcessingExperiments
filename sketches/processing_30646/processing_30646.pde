
size (800,600);
background (0);
smooth();

for ( int i = 0; i < 10; i = i +1){

noFill();
stroke (255);
strokeWeight(random(3));
float radius = random (500);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}

for ( int i = 0; i < 30; i = i +1){

noFill();
stroke (255, 0, 0, 20);
strokeWeight(random(4));
float radius = random (500);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}


for ( int i = 0; i < 30; i = i +1){

noFill();
stroke (0, 255, 0, 20);
strokeWeight(random(4));
float radius = random (700);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}


for ( int i = 0; i < 3; i = i +1){

noFill();
stroke (0, 255, 0);
strokeWeight(random(5));
float radius = random (700);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}


for ( int i = 0; i < 3; i = i +1){

noFill();
stroke (0, 255, 0);
strokeWeight(random(5));
float radius = random (900);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}

for ( int i = 0; i < 3; i = i +1){

noFill();
stroke (255, 255, 255);
strokeWeight(random(5));
float radius = random (600);
arc (width/2,height/2, radius,radius, radians(5), radians ( random(360)) );

}

                
                
