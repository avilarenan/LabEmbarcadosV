import time
import numpy as np
import cv2

on = cv2.imread('on.jpg',1)
off = cv2.imread('off.jpg',1)

def follow():
    try:
      logfile = open("inputForLed.txt","r")
      line = logfile.read()
      logfile.close()
    except:
      return
    #print("reading file")
    #cv2.destroyAllWindows()
    #print(f"{line[0]}")
    if(line != "0"):
        #cv2.imshow('image',on)
        print(f"aceso")
    else:
        #cv2.imshow('image',off)
        print(f"apagado")

if __name__ == '__main__':
    while True:
        follow()
        #time.sleep(5)
