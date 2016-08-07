/**
 * Cronofotografia
 * by Artur Cabral <arturcabralreis@gmail.com> 
 * based on the code of Heino Boekhout <heino@boekhout.net>
 * Developped and tested on Processing 2.1.1 
 * -----
 * Instructions :
 * Down = Dark mode 
 * Up =  Light mode 
 * Left =  Save
 * Right =  Clean
 */
 
import processing.video.*;
Capture video;
char mode = BLEND;
int contador = 0;

void setup() {
  size(1080, 720, P2D); 
  frameRate(30);   
  video = new Capture(this,768,480);
  video.start();
  background(0);
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();}   
 contador  ++;
  blend(video, 0, 0, width, height, 0, 0, width, height, mode);
  delay(500);
  mode = DARKEST;
  
  if (contador == 10){
    contador = 0;
     mode = NORMAL;
    }
}         

void keyPressed() { 
   if(key == CODED) {      
      if (keyCode == DOWN) { // modo escuro 
        mode = LIGHTEST;
        println("Ativado blend escuro");
      }
      
      else if (keyCode == UP) { // modo claro
        mode = LIGHTEST;
        println("Ativado blend claro");        
       }  
      
      else if (keyCode == LEFT) {  
       saveFrame("cronofotografia-####"); 
        println( contador );  
       }               
    
      else if (keyCode == RIGHT) { 
        background(0);
        mode = NORMAL;
        println("Limpar");  
       }               
     }                      
   }      
