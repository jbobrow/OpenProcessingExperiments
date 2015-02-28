
import javax.swing.JTextPane;

boolean show = false;
String text2print = "Automatic text printing procedure with processing.\n" +
  "*****************************************\n\n" +
  "If you want to configure the printer, set 'show' to true, a window will show up.\n" +
  "The default system printer will be used.";

JTextPane jtp = new JTextPane();
jtp.setText( text2print );
try {
  jtp.print(null, null, show, null, null, show);
} catch (java.awt.print.PrinterException ex) {
  ex.printStackTrace();
}

