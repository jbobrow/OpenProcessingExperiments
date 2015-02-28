
   public static void main(String[] args) {
       int Vector [] = new int [20];
       int prom=0,x,mayor,menor;
       String cad=" ";
       // Llenado del vector
       
       for (x=0;x<20;x++)
       {
             Vector[x]=Integer.parseInt(JOptionPane.showInputDialog("Teclea el valor del vector"));
       }
           
       // Obtener mayor, menor y promedio
       
      mayor=menor=Vector[0];
      for(x=0;x<20;x++)
      {
            prom=prom+Vector[x];
            if(Vector[x]<menor)
                  menor=Vector[x];
            if(Vector[x]>mayor)
                  mayor=Vector[x];
      }
        prom=prom/20;
     
      JOptionPane.showMessageDialog(null,"El numero mayor es "+mayor+"\nEl numero menor es "+menor+"\n");
     
      //Impresion del promedio
      JOptionPane.showMessageDialog(null,"Promedio "+prom);
     
      //Impresion de los mayores y menores al promedio
     
      for(x=0;x<20;x++)
      {
            if(Vector[x]<prom)
            cad=cad+Vector[x]+"\n";     
      }
     
       JOptionPane.showMessageDialog(null,"Menores al promedio \n"+ cad);
         cad =" ";
      for(x=0;x<20;x++)
      {
            if(Vector[x]>prom)
                  cad=cad+Vector[x]+"\n";           
      }
         JOptionPane.showMessageDialog(null,"Mayores al promedio \n"+ cad);
      }
}
