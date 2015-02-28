
void setup() {
size(1500,1500);
}
void draw() {
stroke( random (255), random(255), random(255) );
line( (0), (0), random(1500), random(1500) );

stroke( random (255), random(255), random(255) );
line( (1500), (1500), random(1500), random(1500) );

stroke( random (255), random(255), random(255) );
line( (1500), (0), random(1500), random(1500) );

stroke( random (255), random(255), random(255) );
line( (0), (1500), random(1500), random(1500) );
}

