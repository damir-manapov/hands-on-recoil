import { useRecoilState } from 'recoil';
import { counterState } from './atoms/counterState';
import './App.css';

function App() {
  const [count, setCount] = useRecoilState(counterState);

  return (
    <div className="app">
      <h1>Hands-on Recoil</h1>
      <div className="card">
        <button
          onClick={() => {
            setCount((prev) => prev + 1);
          }}
        >
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> to start researching Recoil
        </p>
      </div>
    </div>
  );
}

export default App;
