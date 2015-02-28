
class Chara {
  int rect_size = 20;
  int color_num;

  color[] rect_color = {
    color(46, 52, 54), color(204, 0, 0), color(78, 154, 6), color(196, 160, 0), color(6, 152, 154), color(117, 80, 123), color(6, 152, 154), color(211, 215, 207)
  };

  String[] chara_str;

  Chara(String[] tmpStr) {
    chara_str = tmpStr;
  }

  void display() {
    for (int i = 0; i < chara_str.length; i++) { 
      for (int j = 0; j < chara_str[i].length();j++) { 
        color_num = (int)chara_str[i].charAt(j) - '0';

        if (color_num >= 0) {
          fill(rect_color[color_num]);
        }
        else {
          noFill();
        }
        rect(j*rect_size+30, i*rect_size, rect_size, rect_size);
      }
    }
  }
}


