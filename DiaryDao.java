package com.tirmizee.mvc.dao;
import java.util.List;
import com.tirmizee.mvc.model.Diary;
public interface DiaryDao {

    List<Diary> findAllByUser(int userId);

    void save(Diary diary);

    Diary findById(int id);

    void update(Diary diary);

    void delete(int id);
    int countAllByUser(int userId);
    int countPhotosByUser(int userId);
    Diary findToday(int userId, String today);
    
    List<Diary> searchByKeyword(int userId, String keyword); // search
    List<Diary> findPaged(int userId, int offset, int limit); //pagination
    int countThisMonth(int userId);
    int calculateStreak(int userId);
}
