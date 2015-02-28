
int[] answer_nums;
int[] age_nums;
int[] gend_nums;

void setup()
{
  size(500,500);
  smooth();
  answer_nums = int(loadStrings("answers.txt"));  
  age_nums = int(loadStrings("age.txt")); 
  gend_nums = int(loadStrings("gender.txt")); 
  
}





void draw()
{
  background(150,150,50);
  for(int i=0; i<answer_nums.length; i++)
{
  barGraph(answer_nums, age_nums, gend_nums, height/2);
}
}






void barGraph(int [] answer_nums, int age_nums[], int gend_nums[], float y )
{
  for(int i=0; i<age_nums.length; i++) //loop n times (n = array lengths)
  {
    stroke(answer_nums[i], 100,100); //or whatever you want...
    fill(100, 100, gend_nums[i]); //use gender for the hue
    rect(i*width/age_nums.length, y, 7, -age_nums[i]); //height based on age...
  }
}



