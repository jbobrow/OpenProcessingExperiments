
int radi_planeta = 20;
float temps = 0;
float K = 1;
float periode_Mercuri;
float amplitud_Mercuri = 50.0;
float posicio_x_Mercuri;
float posicio_y_Mercuri;
float periode_Venus;
float amplitud_Venus = 100.0;
float posicio_x_Venus;
float posicio_y_Venus;
float periode_Terra;
float amplitud_Terra = 150.0;
float posicio_x_Terra;
float posicio_y_Terra;

void setup(){
size(600,600);
periode_Mercuri = sqrt(K*pow(amplitud_Mercuri,3));
periode_Venus = sqrt(K*pow(amplitud_Venus,3));
periode_Terra = sqrt(K*pow(amplitud_Terra,3));
}
void draw(){
background (255,255, 255);
noStroke();
posicio_x_Tierra = width/2 + amplitud_Mercuri * cos(2 * PI * temps / periode_Mercuri);
posicio_y_Tierra = width/2 + amplitud_Mercuri * cos(2 * PI * temps / periode_Mercuri + PI / 2);
fill(244,56,0);
ellipse(posicio_x_Tierra,posicio_y_Tierra, radi_planeta, radi_planeta);
posicio_x_Marte = width/2 + amplitud_Venus * cos(2 * PI * temps / periode_Venus);
posicio_y_Marte = width/2 + amplitud_Venus * cos(2 * PI * temps / periode_Venus + PI / 2);
fill(236,56,0);
ellipse(posicio_x_Marte,posicio_y_Marte, radi_planeta, radi_planeta);
posicio_x_Marte = width/2 + amplitud_Terra * cos(2 * PI * temps / periode_Terra);
posicio_y_Marte = width/2 + amplitud_Terra * cos(2 * PI * temps / periode_Terra + PI / 2);
fill(222,56,0);
ellipse(posicio_x_Marte, posicio_y_Marte, radi_planeta, radi_planeta);
temps  = temps  + 1;
}
