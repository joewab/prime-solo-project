import { put, takeLatest } from 'redux-saga/effects';
import axios from 'axios';


function* createClass(action) {
    const className = action.payload.newClassName;
    const userId = action.payload.userId;
    console.log('payload from create class',action.payload);
    try {
        yield axios({
            method: 'POST',
            url: 'api/classes',
            data: { className, userId }
        })
        yield put({
            type: 'FETCH_CLASSES',
            payload: userId
        })
    } catch {
        console.log('error in createGallery');
    }
}

function* fetchClasses(action){
    try{
        console.log('action payload in fetch classes:', action.payload);
        const userId = action.payload;
        const classes = yield axios.get(`/api/classes/${userId}`);
        yield put ({
            type: 'SET_CLASSES',
            payload: classes.data
        })

    }catch{
        console.log('error in fetch all classes');
    }
}


function* classesSaga() {
    
    yield takeLatest('CREATE_CLASS', createClass);
    yield takeLatest('FETCH_CLASSES', fetchClasses);

}

export default classesSaga;