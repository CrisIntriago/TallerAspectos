package com.bank;

import java.io.*;
import java.util.Calendar;

public aspect Logger {
	
	 Calendar cal = Calendar.getInstance();

	 pointcut success() : call(void moneyMakeTransaction());
	 after() : success() {
		 System.out.println("Tipo de transaccion: Transaccion   "+"Hora: "+cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE)+"\n");
		 try {

			 FileWriter writer = new FileWriter("Log.txt", true);
			 BufferedWriter bufferedWriter = new BufferedWriter(writer);
			 bufferedWriter.write("Tipo de transaccion: Transaccion   "+"Hora: "+cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE)+"\n");
			 bufferedWriter.close();
		 	 } catch (IOException e) {
		 	 e.printStackTrace();
		 	 }
	 }
	 
	 pointcut success2() : call(void moneyWithdrawal() );
	 after() : success2() {
		 System.out.println("Tipo de transaccion: Retiro   "+"Hora: "+cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE)+"\n");
		 try {

			 FileWriter writer = new FileWriter("Log.txt", true);
			 BufferedWriter bufferedWriter = new BufferedWriter(writer);
			 bufferedWriter.write("Tipo de transaccion: Retiro   "+"Hora: "+cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE)+"\n");
			 bufferedWriter.close();
		 	 } catch (IOException e) {
		 	 e.printStackTrace();
		 	 }

	 }
}
