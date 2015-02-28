
import javax.swing.*;
boolean cond = true;
int r = (int) random (1,51);
int d = 0;
while(cond){
  String conv = JOptionPane.showInputDialog(null, "Adivina el numero \n Es del uno al cincuenta");
  int num = Integer.parseInt(conv);
  d++;
  if(num == r){
    cond = false;
    JOptionPane.showMessageDialog(null,"Correcto, el numero es: "+ r +"\n Numero de intentos: "+ d);
  }
  else if(num > r){
    JOptionPane.showMessageDialog(null, "Incorrecto, intenta un numero mas chico \n Numero de intentos: "+ d);
  }
  else if (num < r){
    JOptionPane.showMessageDialog(null, "Incorrecto, intenta un numero mas grande \n Numero de intentos: "+ d);
  }
}


