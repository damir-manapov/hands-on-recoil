import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { RecoilRoot } from 'recoil';
import { ErrorBoundary } from './ErrorBoundary';
import App from './App.tsx';
import './index.css';

const rootElement = document.getElementById('root');
if (!rootElement) {
	throw new Error('Root element not found');
}

createRoot(rootElement).render(
	<StrictMode>
		<ErrorBoundary>
			<RecoilRoot>
				<App />
			</RecoilRoot>
		</ErrorBoundary>
	</StrictMode>
);
