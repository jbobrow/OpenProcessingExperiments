
String pastedMessage;
PImage pastedImage;

void keyPressed()
{
  if (key == 0x16) // Ctrl+v
  {
    pastedMessage = GetTextFromClipboard();
    pastedImage = GetImageFromClipboard();
    myTextfield.setValue(pastedMessage);
    myTextfield.update();
    println(pastedMessage);
  }
}

String GetTextFromClipboard()
{
  String text = (String) GetFromClipboard(DataFlavor.stringFlavor);
  return text;
}

PImage GetImageFromClipboard()
{
  PImage img = null;
  java.awt.Image image = (java.awt.Image) GetFromClipboard(DataFlavor.imageFlavor);
  if (image != null)
  {
    img = new PImage(image);
  }
  return img;
}

Object GetFromClipboard(DataFlavor flavor)
{
  Clipboard clipboard = getToolkit().getSystemClipboard();
  Transferable contents = clipboard.getContents(null);
  Object obj = null;
  if (contents != null && contents.isDataFlavorSupported(flavor))
  {
    try
    {
      obj = contents.getTransferData(flavor);
    }
    catch (UnsupportedFlavorException exu) // Unlikely but we must catch it
    {
      println("Unsupported flavor: " + exu);
      //~ exu.printStackTrace();
    }
    catch (java.io.IOException exi)
    {
      println("Unavailable data: " + exi);
      //~ exi.printStackTrace();
    }
  }
  return obj;
} 

void mouseClicked(){
  myTextfield.clear();
}

