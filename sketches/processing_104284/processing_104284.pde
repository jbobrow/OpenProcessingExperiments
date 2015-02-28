
float increment = 1.05;
int max_nodes = 100;

float start = 1;
float[] numbers = new float[max_nodes];
float[] mapped_numbers = new float[max_nodes];
float[] reversed_numbers = new float[max_nodes];

int default_angle = 45;

void setup()
{
size(500,500); 

for(int a = 0; a < max_nodes; a++)
  {
  numbers[a] = start;
  start = start*increment;
  }
  
  for(int b = 0; b < max_nodes; b++)
  {
  mapped_numbers[b] = map(numbers[b], numbers[0], numbers[max_nodes-1], 0 - default_angle, 180 - default_angle);
  reversed_numbers[b] = map(numbers[b], numbers[0], numbers[max_nodes-1], 360 - default_angle, 180 - default_angle);
  }
  
  mapped_numbers = splice(mapped_numbers, reverse(reversed_numbers), max_nodes);
  //println(mapped_numbers);
  
  line(width/2 - 20, height/2, width/2 + 20, height/2);
  line(width/2, height/2 - 20, width/2, height/2 + 20);
  
  for(int c = 0; c < mapped_numbers.length; c++)
  {
  
  float x = width/2 + cos(radians(mapped_numbers[c]))*200;
  float y = height/2 + sin(radians(mapped_numbers[c]))*200;
  ellipse(x, y, 1, 1);
    
  }
}


