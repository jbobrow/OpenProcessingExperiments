
class Copa {
  float x_, y_, angle_, length_;
  float length_fac_ = .7;
   
  Copa(){
  }
   
  void manageLength(){
    length_ *= length_fac_;
  }
   
}

