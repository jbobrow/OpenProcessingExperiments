
class Comment {

  String venue;
  String neighborhood;
  String rating;
  String commentary;
  float x;
  float y;
  color c;
  String txt;


  Comment(String venue_, String neighborhood_, String rating_, String commentary_, float x_, float y_, color c_) {

    venue = venue_;
    neighborhood = neighborhood_;
    rating = rating_;
    commentary = commentary_;
    x = x_;
    y = y_;
    c = c_;
  }

  void display() {
    fill(c);
    String txt = venue + "  " + rating + "\n" + neighborhood + "\n" + commentary;
    text(txt, x, y+20, 500, 800);
  }

}


