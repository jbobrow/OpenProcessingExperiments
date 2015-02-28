
ArrayList<String> text = new ArrayList();

void setup(){
  
  size (400, 400);
  
  // add Strings to the array
  text.add("Hello");
  text.add("World");
  
  textSize(40);
  // use text.size() instead of array.length
  // use text.get(i) instead of array[i]
  for(int i=0; i<text.size(); i++){
    text(text.get(i), 50, i*50+50);        
  }
}


