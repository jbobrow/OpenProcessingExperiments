
class Word{
  
  
  String word_;
  int appearance_ = 0; 
  
  float text_size_ = 0;
  PVector center_ = new PVector();
  

  float height_;
  float width_;
  
  Word(String word){
    word_ = word;
    appearance_ = 1;
  }
  
  // place the texts randomly around the center of the frame
  void initRandomPosition(){
    textSize(text_size_);
    width_    = textWidth(word_);
    height_   = textAscent()+textDescent();
    center_.x = random(width_,  width- width_);
    center_.y = random(height_, height-height_);
    
    center_.x = random(width/2 -100, width/2 +100);
    center_.y = random(height/2-100, height/2+100);
  }
  
  void updatePosition(ArrayList<Word> other_words){
    
    for(Word w : other_words){ 
      
    //another way to iterate through a for-loop, same as the following:
    //for(int i = 0; i < other_words.size(); i++ ){
    //  Word w = other_words.get(i);
    
      if( w == this ) 
        continue;
      // calculate the distance of the current words center, to the word-center in the list
      PVector dis_vec = PVector.sub(w.center_, center_);
      // length of the distance
      float dir_length = dis_vec.mag(); 

      // calculate the min distance in x/y between texts, so that they dont overlap
      float diff_w = width_/2  + w.width_/2;
      float diff_h = height_/2 + w.height_/2;
      
      // d_min is tha radius, of something like a boundingbox
      float d_min = (float) Math.sqrt(diff_w*diff_w + diff_h*diff_h) ;
 
      float rest_dif = d_min - dir_length;
      if( rest_dif < 0 ) rest_dif = 0;
      
      float f = rest_dif/10f;
 
      dis_vec.normalize();
      PVector dir = PVector.mult(dis_vec, f);

      // keep everything inside the frame
      if( width_ >= w.width_ ){
        w.move(dir);
        dir.mult(-.01);
        move(dir);
      } else {
        dir.mult(-1);
        move(dir);
        dir.mult(-.01);
        w.move(dir);
      }
    }
  }
  
  
  
  // called for mouse-attraction
  void updateMouse(PVector mouse){
    PVector dis_vec = PVector.sub(mouse, center_);
    float dir_length = dis_vec.mag();
    //dis_vec.normalize();
    float f = 30/((float) Math.sqrt(dir_length*dir_length*dir_length));
    if( f < 0) f = 0;
    
    if( mouseButton == LEFT) f = -f;
    
    dis_vec.mult(f);
    move(dis_vec);
  }
  
  
  // update the position of the tex
  void move(PVector dir){
    PVector np = PVector.add(center_, dir);
    center_.add(dir);
    int offset = 10;
    float x_min = width_/2 + offset;
    float x_max = width - width_/2 - offset;
    float y_min = height_/2 + offset;
    float y_max = height - height_/2 - offset;

    if( center_.x < x_min ) center_.x = x_min;
    if( center_.x > x_max ) center_.x = x_max;
    if( center_.y < y_min ) center_.y = y_min;
    if( center_.y > y_max ) center_.y = y_max;
    
  }
}

