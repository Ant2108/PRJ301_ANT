/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UserDAO {
    ArrayList<UserDTO> list;

    public UserDAO() {
        this.list = new ArrayList<>();
        list.add(new UserDTO("admin","Administrator","1","AD",true));
        list.add(new UserDTO("se192300","Anh Ngan","hcm","MB",true));
    }
    
    public boolean login(String username,String password){
        for(UserDTO userDTO: list){
            if(userDTO.getUserID().equals(username) && 
                    userDTO.getPassword().equals(password)){
                return true;
            }
        }
        return false;
    }
    
    public UserDTO getUserById(String userID){
        for(UserDTO userDTO:list){
            if(userDTO.getUserID().equalsIgnoreCase(userID)){
                return userDTO;
            }
        }
        return null;
    }
}
